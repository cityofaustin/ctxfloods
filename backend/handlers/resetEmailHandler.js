const nodemailer = require('nodemailer');
const Client = require('pg').Client;
const jwt = require('jsonwebtoken');

module.exports.handle = (event, context, cb) => {
  const pgClient = new Client(process.env.PGCON);
  pgClient.connect();

  pgClient.query('select id from floods.user where email_address = $1::text', ['superadmin@flo.ods'])
    .then(pgres => 
    {
      const token = jwt.sign({ user_id: pgres.rows[0].id, role: 'floods_password_resetter' }, 'keyboard_kitten', {expiresIn: '30m', audience: 'postgraphql'});

      // Generate SMTP service account from ethereal.email
      nodemailer.createTestAccount((err, account) => {
          if (err) {
              console.error('Failed to create a testing account. ' + err.message);
              return process.exit(1);
          }

          console.log('Credentials obtained, sending message...');

          // Create a SMTP transporter object
          let transporter = nodemailer.createTransport({
              host: account.smtp.host,
              port: account.smtp.port,
              secure: account.smtp.secure,
              auth: {
                  user: account.user,
                  pass: account.pass
              }
          });

          // Message object
          let message = {
              from: 'CTXfloods <resetpassword@ctx.floods>',
              to: 'Recipient <recipient@example.com>',
              subject: 'Reset CTXfloods Password',
              text: `CTXfloods password reset url: http://localhost:3000/dashboard/reset_password/${token}`,
              html: `<p>Click <a href="http://localhost:3000/dashboard/reset_password/${token}">here</a> to reset your CTXfloods password.</p>`
          };

          transporter.sendMail(message, (err, info) => {
              if (err) {
                  console.log('Error occurred. ' + err.message);
                  return process.exit(1);
              }

              console.log('Message sent: %s', info.messageId);
              // Preview only available when sending through an Ethereal account
              console.log('Preview URL: %s', nodemailer.getTestMessageUrl(info));
          });

          cb(null, null);
      });
    })
    .catch(err => console.log({"errors": [err]}))
    .then(() => pgClient.end());  
}
