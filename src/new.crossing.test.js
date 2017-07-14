import HttpTransport from 'lokka-transport-http';
import Lokka from 'lokka';

const anonLokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql')});
const superAdminEmail = 'superadmin@flo.ods';
const communityAdminEmail = 'admin@community.floods';
const communityEditorEmail = 'editor@community.floods';
const everyPassword = 'texasfloods';

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

function shouldWork(email, password, communityId, extra_description) {
  describe('as ' + email + ' ' + (extra_description || ''), () => {
    var lokka;

    beforeAll(async (done) => {
      getToken(email, password).then((token) => {
        const headers = {
          'Authorization': 'Bearer '+ token
        };
        lokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql', {headers})});
        done();
      });
    });

    var newCrossingId;

    it('should add the crossing', async () => {
      const response = await lokka.send(`
        mutation($communityId:Int!) {
          newCrossing(input: {
            name: "New Crossing"
            humanAddress: "In test land"
            description: "TEST LAND IS MAGIC!"
            communityId: $communityId
          }) {
            crossing {
              id
            }
          }
        }
      `,
      {
        communityId: communityId,

      });

      newCrossingId = response.newCrossing.crossing.id;
      expect(response).not.toBeNull();
    });

    it('the new crossing should show up in the DB', async () => {
      const response = await lokka.send(`
        query ($id: Int!) {
          crossingById(id: $id) {
            name
            humanAddress
            description
            communityCrossingsByCrossingId {
              nodes {
                communityId
              }
            }
          }
        }
      `,
      {
        id: newCrossingId
      });

      expect(response).toMatchSnapshot();
    });

  }); 
}

function shouldFail(email="", password="", extra_description) {
  describe('as ' + email + ' ' + (extra_description || ''), () => {  
    var lokka;

    beforeAll(async (done) => {

      if(!(email & password)) {
        lokka = anonLokka;
        done();
      }

      getToken(email, password).then((token) => {
        const headers = {
          'Authorization': 'Bearer '+ token
        };
        lokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql', {headers})});
        done();
      });
    });

    // TESTS THAT SHOULD FAIL GO HERE
    
  });
}

describe('When adding a new crossing', () => {
  shouldWork(superAdminEmail, everyPassword, 1);
});
