// Check if branch should be deployed based on settings in devDeployConfig
const devDeployConfig = require('./devDeployConfig.js');''
const branch = require('./getBranch.js')();

// Message to Travis must be written to stdOut via console.log
console.log(devDeployConfig[branch] && devDeployConfig[branch].deploy);
