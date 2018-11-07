/**
  Config file to determine how dev branches should be deployed.
  If dev branch is not listed here, then it will not be deployed.
  Master branch will always deploy, it does not use this config.

  [branch-name]: {
      deploy: Boolean (indicate whether to deploy or not),
      backend: Service Endpoint for backend you want to point to.
               Defaults to dev.
               Can be found in AWS Cloud Formation Stack Outputs.
  }
**/

module.exports = {
  "dev": {
    deploy: true
  },
  "392-duration": {
    deploy: true,
    backend: "https://4tihkup6g2.execute-api.us-east-1.amazonaws.com/dev"
  }
};
