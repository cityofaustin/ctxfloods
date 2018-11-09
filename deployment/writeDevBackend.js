const fs = require('fs');

const devDeployConfig = require('./devDeployConfig.js');''
const getBranch = require('./getBranch.js');

/**
  If a specific backend URL was specified in devDeployConfig, then use that.
  That URL will be written to a file and then sourced in deploy.sh.
  If not backend URL was specified, then backend will default to $TRAVIS_BACKEND_DEV.
**/
const writeDevBackend = () => {
  const branch = getBranch();
  if (branch !== "master" && devDeployConfig[branch] && devDeployConfig[branch].backend) {
    fs.writeFileSync(`${__dirname}/dev_react_app_backend_url.tmp`, `export REACT_APP_BACKEND_URL=${devDeployConfig[branch].backend}`);
  }
}

module.exports = writeDevBackend;

if (require.main === module) {
  writeDevBackend();
}
