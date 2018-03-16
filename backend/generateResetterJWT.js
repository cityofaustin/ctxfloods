const Client = require('pg').Client;
var jwt = require('jsonwebtoken');

const pgClient = new Client("postgresql://floods_postgraphql@localhost:5432/floods");
pgClient.connect();

// pgClient.query('select id from floods.user where email = $1::text', ['superadmin@flo.ods'])
pgClient.query('select id from floods.user where email_address = $1::text', ['superadmin@flo.ods'])
  .then(pgres => 
  {
    const token = jwt.sign({ user_id: pgres.rows[0].id, role: 'floods_password_resetter' }, 'keyboard_kitten', {expiresIn: '30m', audience: 'postgraphql'});
    console.log(token);
  })
  .catch(err => console.log({"errors": [err]}))
  .then(() => pgClient.end());    
