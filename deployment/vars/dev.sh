# AWS
export AWS_ACCESS_KEY_ID=$TRAVIS_ACCESS_KEY_ID_DEV
export AWS_SECRET_ACCESS_KEY=$TRAVIS_SECRET_ACCESS_KEY_DEV
case $TRAVIS_EVENT_TYPE in
  push)
    # Set to branch name during push builds
    export BUCKET_NAME=ctxfloods-frontend-$TRAVIS_BRANCH
    ;;
  pull_request)
    # Set to origin branch name during pull requests
    export BUCKET_NAME=ctxfloods-frontend-$TRAVIS_PULL_REQUEST_BRANCH
    ;;
  api | cron)
    # The final 2 Travis Event Types.
    # We should not run across these cases with our script.
    # But just in case, set the suffix to the Travis job id.
    export BUCKET_NAME=ctxfloods-frontend-$TRAVIS_EVENT_TYPE-$TRAVIS_JOB_ID
    ;;
esac

# App
export REACT_APP_BACKEND_URL=$TRAVIS_BACKEND_DEV
