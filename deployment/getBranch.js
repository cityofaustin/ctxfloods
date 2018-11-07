// Get name of branch during TravisCI deployment
module.exports = () => {
  let branch;
  if (process.env.TRAVIS_PULL_REQUEST === "false") {
    branch = process.env.TRAVIS_BRANCH;
  } else {
    branch = process.env.TRAVIS_PULL_REQUEST_BRANCH;
  }
  return branch;
}
