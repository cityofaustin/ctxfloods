import HttpTransport from 'lokka-transport-http';
import Lokka from 'lokka';
import queryPublicData from './queryPublicData';
import authenticate from './authenticate';

const anonLokka = new Lokka({transport: new HttpTransport('http://localhost:5000/graphql')});
const superAdminEmail = 'superadmin@flo.ods';
const communityAdminEmail = 'admin@community.floods';
const communityEditorEmail = 'editor@community.floods';
const everyPassword = 'texasfloods';
const wrongPassword = 'wrong';

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

function shouldWork(email, password, extra_description) {
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

    it('should get the correct current user', async () => {
      const response = await lokka.send(`
        {
          currentUser {
            id
          }
        }
      `);

      expect(response).toMatchSnapshot();
    });
  }); 
}

function shouldFail(email, password, extra_description) {
      console.log("BKARG")
      console.log(email & password)

  describe('as ' + email + ' ' + (extra_description || ''), () => {  
    var lokka;

    beforeAll(async (done) => {

      if(!(email & password)) {
        console.log("ANON");
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

    it('should fail to get the current user', async () => {
      try {
        const response = await anonLokka.send(`
        {
          currentUser {
            id
          }
        }
      `);
      } catch(e) {
        expect(e).toMatchSnapshot();
      }
    });
  });
}

describe('When getting current user', () => {
  // shouldFail();
  shouldWork(superAdminEmail, everyPassword);
  //shouldFail(superAdminEmail, wrongPassword);
  shouldWork(communityAdminEmail, everyPassword);
  //shouldFail(communityAdminEmail, wrongPassword);
  shouldWork(communityEditorEmail, everyPassword);
  //shouldFail(communityEditorEmail, wrongPassword);
});
