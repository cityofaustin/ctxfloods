const parseString = require('xml2js').parseString;
const fs = require('fs');

const communities = {
  'LEA': 9001,
  'ALL': 9002,
  'CPK': 9003,
  'RRK': 9004,
  'WLH': 9005,
  'MBF': 9006,
  'SSV': 9007,
  'PFL': 9008,
  'pfl': 9008,
  'COA': 9009,
  'TCO': 9010,
  'CCO': 9011,
  'BCO': 9012,
  'LEECO': 9013,
  'ROL': 9014,
  'GEO': 9015,
  'HCO': 9016,
  'WCO': 9017,
  'FCO': 9018,
}

const statuses = {
  'on': 1,
  'off': 2,
}

fs.readFile(
  './crossings.xml', 'utf8',
  (err, data) => {
    parseString(data, (err, result) => {
      const crossings = result.markers.marker.map((crossing, count) => `\n(${count+1}, ${crossing.$.id}, '${crossing.$.name}', '${crossing.$.address}', 'description', ST_MakePoint(${crossing.$.lng}, ${crossing.$.lat}), ST_AsGeoJSON(ST_MakePoint(${crossing.$.lng}, ${crossing.$.lat})), '{${communities[crossing.$.jurisdiction]}}')`);
      fs.writeFile('./tools/addCrossings.sql', crossings, err => {
        if (err) {
          console.log(err);
        }
        console.log('Wrote to /tools/addCrossings.sql');
      });

      const updates = result.markers.marker.map((crossing, count) => `\n(${count+1}, ${statuses[crossing.$.type]}, 1, ${count+1}, 'notes', '2017-09-03T09:27:57Z')`);
      fs.writeFile('./tools/addStatuses.sql', updates, err => {
        if (err) {
          console.log(err);
        }
        console.log('Wrote to /tools/addStatuses.sql');
      });

      const latests = result.markers.marker.map((crossing, count) => `\nupdate floods.crossing set latest_status_update_id = ${count+1}, latest_status_id = ${statuses[crossing.$.type]}, latest_status_created_at = '2017-09-03T09:27:57Z' where id = ${count+1};`).join('');
      fs.writeFile('./tools/addLatests.sql', latests, err => {
        if (err) {
          console.log(err);
        }
        console.log('Wrote to /tools/addLatests.sql');
      });
    })
  },
);
