/**
  Config file to determine how dev branches should be deployed.
  If dev branch is not listed here, then it will not be deployed.
  Master branch will always deploy, it does not use this config.

  [branch-name]: {
      deploy: Boolean (indicate whether to deploy or not),
      backend: Branch name of the backend you want to point to.
               writeDevBackend.js will find the Service Endpoint for backend you want to point to.
               Defaults to dev.
  }
**/

module.exports = {
  "dev": {
    deploy: true
  },
  "392-duration": {
    deploy: true,
    backend: "392-duration"
  },
  "379-graphile": {
    deploy: true,
    backend: "379-graphile"
  },
  "390-push-notify": {
    deploy: true,
    backend: "390-push-notify"
  },
  "402-community": {
    deploy: true,
    backend: "402-community"
  },
  "382-history": {
    deploy: true,
    backend: "sandbox-1"
  },
  "195-camera": {
    deploy: true,
    backend: "195-camera"
  }
};
