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

describe('As a super admin', async () => {
  const superAdminEmail = 'superadmin@flo.ods';
  const superAdminPassword = 'texasfloods';

  describe('when updating the status of a crossing', () => {
    describe('To OPEN', () => {
      describe('with no REASON or DURATION', async () => {
        shouldWork(superAdminEmail, superAdminPassword, 1, 3, 'OPEN with no REASON or DURATION');
      });

      describe('with REASON', () => {
        shouldFail(superAdminEmail, superAdminPassword, 1, 3, 'OPEN with REASON', 1);
      });

      describe('with DURATION', () => {
        shouldFail(superAdminEmail, superAdminPassword, 1, 3, 'OPEN with DURATION', null, 1);
      });

      describe('with REASON and DURATION', async () => {
        shouldFail(superAdminEmail, superAdminPassword, 1, 3, 'OPEN with REASON and DURATION', 1, 1);
      });
    });

    describe('To CLOSED', () => {
      describe('with no REASON or DURATION', async () => {
        shouldFail(superAdminEmail, superAdminPassword, 2, 3, 'CLOSED with no REASON or DURATION');
      });

      describe('with REASON', () => {
        shouldWork(superAdminEmail, superAdminPassword, 2, 3, 'CLOSED with REASON', 1);
      });

      describe('with DURATION', () => {
        shouldFail(superAdminEmail, superAdminPassword, 2, 3, 'CLOSED with DURATION', null, 1);
      });

      describe('with REASON and DURATION', async () => {
        shouldFail(superAdminEmail, superAdminPassword, 2, 3, 'CLOSED with REASON and DURATION', 1, 1);
      });
    });
  });



  // describe('To CLOSED', () => {
  //   describe('with no REASON or DURATION', () => {
  //     it('should fail to update the status', () => {

  //     });
  //   });

  //   describe('with REASON', () => {
  //     it('should fail to update the status', () => {

  //     });
  //   });

  //   describe('with DURATION', () => {
  //     it('should fail to update the status', () => {

  //     });
  //   });

  //   describe('with REASON and DURATION', () => {
  //     it('should fail to update the status', () => {

  //     });
  //   });
  // });


});
