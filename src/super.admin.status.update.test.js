import HttpTransport from 'lokka-transport-http';
import Lokka from 'lokka';
import queryPublicData from './queryPublicData';
import authenticate from './authenticate';

const anonLokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql')});
async function getToken(email, password) {
  const response = await anonLokka.send(`
    mutation($email:String!, $password:String!) {
      authenticate(input: {email: $email, password: $password}) {
        jwtToken
      }
    }
  `,
  {
    email: email,
    password: password
  });

  return response.authenticate.jwtToken;
}

function shouldWork(username, password, status, crossing, notes, reason, duration) {
  var originalStatusId;
  var newStatusId;
  var lokka;

  beforeAll(async (done) => {
    getToken(username, password).then((token) => {
      const headers = {
        'Authorization': 'Bearer '+ token
      };
      lokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql', {headers})});
      done();
    });
  });

  it('before updating it should get the current status', async () => {
    const response = await lokka.send(`
      query($crossing:Int!) {
        crossingById(id:$crossing) {
          latestStatus {
            id
          }
        }
      }
    `,
    {
      crossing: crossing
    });

    originalStatusId = response.crossingById.latestStatus.id;
    expect(response).not.toBeNull();
  });

  it('should update the status', async () => {
    const response = await lokka.send(`
      mutation($status:Int,$crossing:Int,$notes:String,$reason:Int,$duration:Int) {
        newStatusUpdate(input: {
          statusId: $status,
          crossingId: $crossing,
          notes: $notes,
          statusReasonId: $reason,
          statusDurationId: $duration
        }) {
          statusUpdate {
            id
            notes
          }
        }
      }
    `,
    {
      status: status,
      crossing: crossing,
      notes: notes,
      reason: reason,
      duration: duration
    });

    newStatusId = response.newStatusUpdate.statusUpdate.id;
    expect(response.newStatusUpdate.statusUpdate.notes).toMatchSnapshot();
  });

  it('the new status should show up in the DB', async () => {
    const response = await lokka.send(`
      query($crossing:Int!) {
        crossingById(id:$crossing) {
          latestStatus {
            id
            notes
          }
        }
      }
    `,
    {
      crossing: crossing
    });

    expect(response.crossingById.latestStatus.id).not.toEqual(originalStatusId);
    expect(response.crossingById.latestStatus.id).toEqual(newStatusId);
    expect(response.crossingById.latestStatus.notes).toMatchSnapshot();
  });
}

function shouldFail(username, password, status, crossing, notes, reason, duration) {
  var originalStatusId;
  var newStatusId;
  var lokka;

  beforeAll(async (done) => {
    getToken(username, password).then((token) => {
      const headers = {
        'Authorization': 'Bearer '+ token
      };
      lokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql', {headers})});
      done();
    });
  });

  it('should fail to update the status', async () => {
    try {
      const response = await lokka.send(`
        mutation($status:Int,$crossing:Int,$notes:String,$reason:Int,$duration:Int) {
          newStatusUpdate(input: {
            statusId: $status,
            crossingId: $crossing,
            notes: $notes,
            statusReasonId: $reason,
            statusDurationId: $duration
          }) {
            statusUpdate {
              id
              notes
            }
          }
        }
      `,
      {
        status: status,
        crossing: crossing,
        notes: notes,
        reason: reason,
        duration: duration
      });
    } catch(e) {
      expect(e).toMatchSnapshot();
    }
  });
}

const superAdminEmail = 'superadmin@flo.ods';
const communityAdminEmail = 'admin@community.floods';
const communityEditorEmail = 'editor@community.floods';
const everyPassword = 'texasfloods';

describe('When updating the status of a crossing', () => {
  describe('To OPEN', () => {
    describe('with no REASON or DURATION', () => {
      describe('as a super admin', () => {
        shouldWork(superAdminEmail, everyPassword, 1, 3, 'OPEN with no REASON or DURATION');
      });
      describe('as a community admin', () => {
        describe('In the same community as the crossing', () => {
          shouldWork(communityAdminEmail, everyPassword, 1, 3, 'OPEN with no REASON or DURATION');
        });
        describe('In another community without the crossing', () => {
          shouldFail(communityAdminEmail, everyPassword, 1, 7, 'OPEN with no REASON or DURATION');
        });
      });
    });

    describe('with REASON', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with REASON and DURATION', 1, 1);
    });

    
  });

  describe('To CLOSED', () => {
    describe('with no REASON or DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with no REASON or DURATION');
    });

    describe('with REASON', () => {
      shouldWork(superAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON and DURATION', 1, 1);
    });
  });

  describe('To CAUTION', () => {
    describe('with no REASON or DURATION', () => {
      shouldWork(superAdminEmail, everyPassword, 3, 3, 'CAUTION with no REASON or DURATION');
    });

    describe('with REASON', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 3, 'CAUTION with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 3, 'CAUTION with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 3, 'CAUTION with REASON and DURATION', 1, 1);
    });
  });

  describe('To LONG TERM CLOSURE', () => {
    describe('with no REASON or DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with no REASON or DURATION');
    });

    describe('with REASON', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldWork(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 1);
    });
  });
});
