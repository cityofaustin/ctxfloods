const http = require('http');
const parser = require('url');
const xmlHandler = require('./handlers/xmlHandler');

console.log(xmlHandler);

const hostname = '127.0.0.1';
const port = 5000;

const server = http.createServer((req, res) => {
  // console.log(req);
  const url = parser.parse(req.url, true);
  console.log(url.pathname);

  switch (url.pathname) {
    case '/xml':
      xmlHandler.handler(null, null, (error, response) => {
        console.log(response);
        res.statusCode = response.statusCode;
        res.setHeader('Content-Type', 'text/xml');
        res.end(response.body);
      })
  }


  // res.statusCode = 200;
  // res.setHeader('Content-Type', 'text/plain');
  // res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
