const nodemailer = require('nodemailer');
const aws = require('aws-sdk');
const Client = require('pg').Client;
const jwt = require('jsonwebtoken');

const sendResetEmail = (transporter, firstname, lastname, email, token, cb) => {
  let message = {
      from: 'CTXfloods <ctxfloodstestmailer@gmail.com>',
      to: `${firstname} ${lastname} <${email}>`,
      subject: 'Reset CTXfloods Password',
      text: `CTXfloods password reset url: http://${process.env.FRONTEND_URL}/dashboard/reset_password/${token}`,
      html: `<p>Click <a href="http://${process.env.FRONTEND_URL}/dashboard/reset_password/${token}">here</a> to reset your CTXfloods password.</p>`
  };

  transporter.sendMail(message, (err, info) => {
      if (err) {
          console.log('Error occurred. ' + err.message);
          return process.exit(1);
      }

      console.log('Message sent: %s', info.messageId);
      // Preview only available when sending through an Ethereal account
      const previewURL = nodemailer.getTestMessageUrl(info);
      console.log('Preview URL: %s', previewURL);
      const response = {
        statusCode: 204,
        headers: { "Access-Control-Allow-Origin" : "*" },
      };

      cb(null, response);
  });
}

module.exports.handle = (event, context, cb) => {
  const pgClient = new Client(process.env.PGCON);
  const { email } = JSON.parse(event.body);

  pgClient.connect();

  pgClient.query('select id, last_name, first_name from floods.user where email_address = $1::text', [email])
    .then(pgres => 
    {
      if (!pgres.rowCount) {
        const response = {
          statusCode: 400,
          headers: { 
            'Access-Control-Allow-Origin' : '*',
            'Content-Type': 'text/plain',
          },
          body: `Could not find user account for email: ${email}`,
        };

        cb(null, response);
        return;
      }

      const firstname = pgres.rows[0].first_name;
      const lastname = pgres.rows[0].last_name;
      const token = jwt.sign({ user_id: pgres.rows[0].id, role: 'floods_password_resetter' }, 'keyboard_kitten', {expiresIn: '30m', audience: 'postgraphql'});

      // If we have AWS credentials, use the AWS sdk to send the email
      if (aws.config.credentials) {
        aws.config.update({region: 'us-east-1'});
        let transporter = nodemailer.createTransport({
            SES: new aws.SES()
        });

        sendResetEmail(transporter, firstname, lastname, email, token, cb);
        return;
      }

      // If we don't have AWS credentials, send an ethereal test email
      // Generate SMTP service account from ethereal.email
      nodemailer.createTestAccount((err, account) => {
          if (err) {
              console.error('Failed to create a testing account. ' + err.message);
              return process.exit(1);
          }

          console.log('Ethereal email credentials obtained, sending message...');

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

          sendResetEmail(transporter, firstname, lastname, email, token, cb);
      });
    })
    .catch(err => console.log({"errors": [err]}))
    .then(() => pgClient.end());  
}
