# AWS
export AWS_ACCESS_KEY_ID=$TRAVIS_ACCESS_KEY_ID_DEV
export AWS_SECRET_ACCESS_KEY=$TRAVIS_SECRET_ACCESS_KEY_DEV
export BUCKET_NAME=ctxfloods-frontend-prod-legacy-sync

# App
export REACT_APP_BACKEND_URL=$TRAVIS_BACKEND_PROD_LEGACY_SYNC
