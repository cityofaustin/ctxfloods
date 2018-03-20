const express = require('express');
const cors = require('cors');

const xmlHandler = require('./handlers/xmlHandler');
const graphqlHandler = require('./handlers/graphqlHandler');
const resetEmailHandler = require('./handlers/resetEmailHandler');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/xml', (req, res) => {
  xmlHandler.handle(null, null, (error, response) => {
    res.statusCode = response.statusCode;
    res.setHeader('Content-Type', 'text/xml');
    res.send(response.body);
  });
});

app.all('/graphql', (req, res) => {
  var event = req.body;
  event.headers = req.headers;
  graphqlHandler.handle(req.body, null, (error, response) => {
    res.statusCode = response.statusCode;
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.end(JSON.stringify({data: response.data}));
  });
});

app.post('/email/reset', (req, res) => {
  resetEmailHandler.handle(req.body, null, (error, response) => {
    res.send(response);
  });
});

app.listen(5000);
