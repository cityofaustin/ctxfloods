const parseString = require('xml2js').parseString;
const fs = require('fs');

fs.readFile(
  './crossings.xml', 'utf8',
  (err, data) => {
    parseString(data, (err, result) => {
      // console.log(result.markers.marker);
      const mapped = result.markers.marker.map((crossing, count) => `\n(${count}, ${crossing.$.id}, '${crossing.$.name}', '${crossing.$.address}', 'description', ST_MakePoint(${crossing.$.lng}, ${crossing.$.lat}), ST_AsGeoJSON(ST_MakePoint(${crossing.$.lng}, ${crossing.$.lat})), '{1}')`);
      fs.writeFile('./tools/addCrossings.sql', mapped, err => {
        if (err) {
          console.log(err);
        }
        console.log('Wrote to /tools/addCrossings.sql');
      });
    })
  },
);
