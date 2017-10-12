import HttpTransport from 'lokka-transport-http';
import Lokka from 'lokka';
import { endpoint } from './endpoints';

const superAdminEmail = 'superadmin@flo.ods';
const communityAdminEmail = 'admin@community.floods';
const communityEditorEmail = 'editor@community.floods';
const everyPassword = 'texasfloods';

const anonLokka = new Lokka({transport: new HttpTransport(endpoint)});
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

function shouldWork(username, password, status, notes, reason, duration, extra_description) {
  var originalStatusId;
  var secondOriginalStatusId;
  var newStatusId;
  var crossingToUpdate;
  var crossingToNotUpdate;
  var lokka;

  describe('as ' + username + ' ' + (extra_description || ''), () => {
    beforeAll(async (done) => {
      getToken(username, password).then((token) => {
        const headers = {
          'Authorization': 'Bearer '+ token
        };
        lokka = new Lokka({transport: new HttpTransport(endpoint, {headers})});
        done();
      });
    });

    describe('before updating', () => {
      it('should add a new crossing', async () => {
        const response = await lokka.send(`
          mutation {
            newCrossing(input: {
              name: "New Crossing"
              humanAddress: "Near the barn"
              description: "Describe!"
              communityId: 1
              longitude: -97.755996
              latitude: 30.30718
            }) {
              crossing {
                id
              }
            }
          }
        `);

        crossingToUpdate = response.newCrossing.crossing.id;
        expect(response).not.toBeNull();
      });

      it('should give it a status', async () => {
        const response = await lokka.send(`
          mutation($crossing:Int) {
            newStatusUpdate(input: {
              statusId: 1,
              crossingId: $crossing,
              notes: "New"
            }) {
              statusUpdate {
                notes
              }
            }
          }
        `,
        {
          crossing: crossingToUpdate
        });

        expect(response.newStatusUpdate.statusUpdate.notes).toMatchSnapshot();
      });

      it('should add a second new crossing', async () => {
        const response = await lokka.send(`
          mutation {
            newCrossing(input: {
              name: "New Crossing 2"
              humanAddress: "Near the barn"
              description: "Describe!"
              communityId: 1
              longitude: -97.755996
              latitude: 30.30718
            }) {
              crossing {
                id
              }
            }
          }
        `);

        crossingToNotUpdate = response.newCrossing.crossing.id;
        expect(response).not.toBeNull();
      });

      it('should give it a status', async () => {
        const response = await lokka.send(`
          mutation($crossing:Int) {
            newStatusUpdate(input: {
              statusId: 1,
              crossingId: $crossing,
              notes: "Second"
            }) {
              statusUpdate {
                notes
              }
            }
          }
        `,
        {
          crossing: crossingToNotUpdate
        });

        expect(response.newStatusUpdate.statusUpdate.notes).toMatchSnapshot();
      });

      it('it should get the current status', async () => {
        const response = await lokka.send(`
          query($crossing:Int!) {
            crossingById(id:$crossing) {
              statusUpdateByLatestStatusId {
                id
              }
            }
          }
        `,
        {
          crossing: crossingToUpdate
        });

        originalStatusId = response.crossingById.statusUpdateByLatestStatusId.id;
        expect(response).not.toBeNull();
      });

      it('it should get the second current status', async () => {
        const response = await lokka.send(`
          query($crossing:Int!) {
            crossingById(id:$crossing) {
              statusUpdateByLatestStatusId {
                id
              }
            }
          }
        `,
        {
          crossing: crossingToNotUpdate
        });

        secondOriginalStatusId = response.crossingById.statusUpdateByLatestStatusId.id;
        expect(response).not.toBeNull();
      });
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
        crossing: crossingToUpdate,
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
            statusUpdateByLatestStatusId {
              id
              notes
            }
          }
        }
      `,
      {
        crossing: crossingToUpdate
      });

      expect(response.crossingById.statusUpdateByLatestStatusId.id).not.toEqual(originalStatusId);
      expect(response.crossingById.statusUpdateByLatestStatusId.id).toEqual(newStatusId);
      expect(response.crossingById.statusUpdateByLatestStatusId.notes).toMatchSnapshot();
    });

    it('the second crossing should still have the original status', async () => {
      const response = await lokka.send(`
        query($crossing:Int!) {
          crossingById(id:$crossing) {
            statusUpdateByLatestStatusId {
              id
              notes
            }
          }
        }
      `,
      {
        crossing: crossingToNotUpdate
      });

      expect(response.crossingById.statusUpdateByLatestStatusId.id).toEqual(secondOriginalStatusId);
      expect(response.crossingById.statusUpdateByLatestStatusId.notes).toMatchSnapshot();
    });
  });
}

function shouldFail(username, password, status, crossing, notes, reason, duration, extra_description) {
  var originalStatusId;
  var newStatusId;
  var lokka;

  describe('as ' + username + ' ' + (extra_description || ''), () => {
    beforeAll(async (done) => {
      getToken(username, password).then((token) => {
        const headers = {
          'Authorization': 'Bearer '+ token
        };
        lokka = new Lokka({transport: new HttpTransport(endpoint, {headers})});
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
  });
}

describe('When updating the status of a crossing', () => {
  describe('To OPEN', () => {
    describe('with no REASON or DURATION', () => {
      shouldWork(superAdminEmail, everyPassword, 1, 'OPEN with no REASON or DURATION');
      shouldWork(communityAdminEmail, everyPassword, 1, 'OPEN with no REASON or DURATION',null,null,'In the same community as the crossing');
      shouldFail(communityAdminEmail, everyPassword, 1, 7, 'OPEN with no REASON or DURATION',null,null,'In another community without the crossing');
      shouldWork(communityEditorEmail, everyPassword, 1, 'OPEN with no REASON or DURATION',null,null,'In the same community as the crossing');
      shouldFail(communityEditorEmail, everyPassword, 1, 7, 'OPEN with no REASON or DURATION',null,null,'In another community without the crossing');
    });

    describe('with REASON', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with REASON', 1);
      shouldFail(communityAdminEmail, everyPassword, 1, 3, 'OPEN with REASON', 1);
      shouldFail(communityEditorEmail, everyPassword, 1, 3, 'OPEN with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with DURATION', null, 1);
      shouldFail(communityAdminEmail, everyPassword, 1, 3, 'OPEN with DURATION', null, 1);
      shouldFail(communityEditorEmail, everyPassword, 1, 3, 'OPEN with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 1, 3, 'OPEN with REASON and DURATION', 1, 1);
      shouldFail(communityAdminEmail, everyPassword, 1, 3, 'OPEN with REASON and DURATION', 1, 1);
      shouldFail(communityEditorEmail, everyPassword, 1, 3, 'OPEN with REASON and DURATION', 1, 1);
    });
  });

  describe('To CLOSED', () => {
    describe('with no REASON or DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with no REASON or DURATION');
      shouldFail(communityAdminEmail, everyPassword, 2, 3, 'CLOSED with no REASON or DURATION');
      shouldFail(communityEditorEmail, everyPassword, 2, 3, 'CLOSED with no REASON or DURATION');
    });

    describe('with REASON', () => {
      describe('that matches status', () => {
        shouldWork(superAdminEmail, everyPassword, 2, 'CLOSED with REASON', 1);
        shouldWork(communityAdminEmail, everyPassword, 2, 'CLOSED with REASON', 1, null, 'In the same community as the crossing');
        shouldFail(communityAdminEmail, everyPassword, 2, 7, 'CLOSED with REASON', 1, null, 'In another community without the crossing');
        shouldWork(communityEditorEmail, everyPassword, 2, 'CLOSED with REASON', 1, null, 'In the same community as the crossing');
        shouldFail(communityEditorEmail, everyPassword, 2, 7, 'CLOSED with REASON', 1, null, 'In another community without the crossing');
      });
      describe('that does not match status', () => {
        shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON', 2);
        shouldFail(communityAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON', 2);
        shouldFail(communityEditorEmail, everyPassword, 2, 3, 'CLOSED with REASON', 2);
      });
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with DURATION', null, 1);
      shouldFail(communityAdminEmail, everyPassword, 2, 3, 'CLOSED with DURATION', null, 1);
      shouldFail(communityEditorEmail, everyPassword, 2, 3, 'CLOSED with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON and DURATION', 1, 1);
      shouldFail(communityAdminEmail, everyPassword, 2, 3, 'CLOSED with REASON and DURATION', 1, 1);
      shouldFail(communityEditorEmail, everyPassword, 2, 3, 'CLOSED with REASON and DURATION', 1, 1);
    });
  });

  describe('To CAUTION', () => {
    describe('with no REASON or DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 'CAUTION with no REASON or DURATION');
      shouldFail(communityAdminEmail, everyPassword, 3, 'CAUTION with no REASON or DURATION');
      shouldFail(communityEditorEmail, everyPassword, 3, 'CAUTION with no REASON or DURATION');
    });

    describe('with REASON', () => {
      shouldWork(superAdminEmail, everyPassword, 3, 'CAUTION with REASON', 3);
      shouldWork(communityAdminEmail, everyPassword, 3, 'CAUTION with REASON',3,null,'In the same community as the crossing');
      shouldFail(communityAdminEmail, everyPassword, 3, 7, 'CAUTION with REASON',null,null,'In another community without the crossing');
      shouldWork(communityEditorEmail, everyPassword, 3, 'CAUTION with REASON',3,null,'In the same community as the crossing');
      shouldFail(communityEditorEmail, everyPassword, 3, 7, 'CAUTION with REASON',null,null,'In another community without the crossing');
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 3, 'CAUTION with DURATION', null, 1);
      shouldFail(communityAdminEmail, everyPassword, 3, 3, 'CAUTION with DURATION', null, 1);
      shouldFail(communityEditorEmail, everyPassword, 3, 3, 'CAUTION with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 3, 3, 'CAUTION with REASON and DURATION', 3, 1);
      shouldFail(communityAdminEmail, everyPassword, 3, 3, 'CAUTION with REASON and DURATION', 3, 1);
      shouldFail(communityEditorEmail, everyPassword, 3, 3, 'CAUTION with REASON and DURATION', 3, 1);
    });
  });

  describe('To LONG TERM CLOSURE', () => {
    describe('with no REASON or DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with no REASON or DURATION');
      shouldFail(communityAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with no REASON or DURATION');
      shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with no REASON or DURATION');
    });

    describe('with REASON', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON', 1);
      shouldFail(communityAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON', 1);
      shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON', 1);
    });

    describe('with DURATION', () => {
      shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with DURATION', null, 1);
      shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with DURATION', null, 1);
      shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with DURATION', null, 1);
    });

    describe('with REASON and DURATION', () => {
      describe('and both match status', () => {
        shouldWork(superAdminEmail, everyPassword, 4, 'LONG TERM CLOSURE with REASON and DURATION', 2, 2);
        shouldWork(communityAdminEmail, everyPassword, 4, 'LONG TERM CLOSURE with REASON and DURATION', 2, 2,'In the same community as the crossing');
        shouldFail(communityAdminEmail, everyPassword, 4, 7, 'LONG TERM CLOSURE with REASON and DURATION', 2, 2,'In another community without the crossing');
        shouldWork(communityEditorEmail, everyPassword, 4, 'LONG TERM CLOSURE with REASON and DURATION', 2, 2,'In the same community as the crossing');
        shouldFail(communityEditorEmail, everyPassword, 4, 7, 'LONG TERM CLOSURE with REASON and DURATION', 2, 2,'In another community without the crossing');
      });
      describe('and reason matches status', () => {
        shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 2, 1);
        shouldFail(communityAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 2, 1);
        shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 2, 1);
      });
      describe('and duration matches status', () => {
        shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 2);
        shouldFail(communityAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 2);
        shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 2);
      });
      describe('and neither matches status', () => {
        shouldFail(superAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 1);
        shouldFail(communityAdminEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 1);
        shouldFail(communityEditorEmail, everyPassword, 4, 3, 'LONG TERM CLOSURE with REASON and DURATION', 1, 1);
      });
    });
  });
});
