const http = require('http');
const parser = require('url');
const xmlHandler = require('./handlers/xmlHandler');
const graphqlHandler = require('./handlers/graphqlHandler');
const resetEmailHandler = require('./handlers/resetEmailHandler');

const hostname = '127.0.0.1';
const port = 5000;

const server = http.createServer((req, res) => {
  if (req.method === 'OPTIONS') {
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Authorization, Content-Type, Accept');
    res.end();
    return;
  }

  const url = parser.parse(req.url, true);

  switch (url.pathname) {
    case '/xml':
      xmlHandler.handle(null, null, (error, response) => {
        res.statusCode = response.statusCode;
        res.setHeader('Content-Type', 'text/xml');
        res.end(response.body);
      });
      break;

    case '/graphql':
      var body = '';
      req.on('data', data => {
        body += data;
      })
      req.on('end', () => {
        var event = JSON.parse(body);
        event.headers = req.headers;
        graphqlHandler.handle(event, null, (error, response) => {
          res.statusCode = response.statusCode;
          res.setHeader('Access-Control-Allow-Origin', '*');
          res.end(JSON.stringify({data: response.data}));
        });
      });
      break;

    case '/send_reset_email':
      resetEmailHandler.handle(null, null, (error, response) => {
        res.statusCode = 200;
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Content-Type', 'text/plain');
        res.end(response);
      });
      break;
  }
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
