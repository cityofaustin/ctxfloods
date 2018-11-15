const aws = require('aws-sdk');
aws.config.update({region:'us-east-1'});
const cloudFormation = new aws.CloudFormation();
const fs = require('fs');

const devDeployConfig = require('./devDeployConfig.js');
const branch = require('./getBranch.js')();
const advice = `Wait for backend deployment to finish, then retry deploying frontend.`;

/**
  If a specific backend branch was specified in devDeployConfig, then use that.
  That URL will be written to a file and then sourced in deploy.sh.
  If not backend URL was specified, then backend will default to $TRAVIS_BACKEND_DEV.
**/
if (branch !== "master" && devDeployConfig[branch] && devDeployConfig[branch].backend) {
  const stackName = `ctxfloods-backend-${devDeployConfig[branch].backend}-dev`;
  return cloudFormation.describeStacks({StackName: stackName}).promise()
  .then((data)=>{
    const outputs = data.Stacks[0].Outputs;
    if (!outputs) {
      console.log(`No outputs for stack ${stackName}. ${advice}`);
      process.exit(1);
    }
    const serviceEndpointOutput = outputs.filter((o) => o.OutputKey === "ServiceEndpoint");
    if (!serviceEndpointOutput) {
      console.log(`No serviceEndpoint output for stack ${stackName}. ${advice}`);
      process.exit(1);
    }
    const serviceEndpointValue = serviceEndpointOutput[0].OutputValue;
    if (!serviceEndpointValue) {
      console.log(`No serviceEndpoint value for stack ${stackName}. ${advice}`);
      process.exit(1);
    }
    if (serviceEndpointValue) {
      return fs.writeFileSync(`${__dirname}/dev_react_app_backend_url.tmp`, `export REACT_APP_BACKEND_URL=${serviceEndpointValue}`);
    }
  })
  .catch((err)=>{
    console.log(err.message)
    process.exit(1);
  })
}
