#!/bin/bash

# Source env variables for given environment
# `bash deploy.sh prod` deploys with prod variables
# `bash deploy.sh prod-legacy-sync` deploys with prod-legacy-sync variables
# `bash deploy.sh` deploys with dev/feature branch variables
DEPLOY_ENV=$1
CURRENT_DIR=`dirname $BASH_SOURCE`
if \
  [ "$DEPLOY_ENV" != "prod" ] && \
  [ "$DEPLOY_ENV" != "prod-legacy-sync" ]
then
  DEPLOY_ENV=dev
fi
source $CURRENT_DIR/vars/$DEPLOY_ENV.sh

# Create s3 bucket
node $CURRENT_DIR/createS3Bucket.js
if [ $? != 0 ]; then
  echo "Bucket build failed"
  exit 1
fi

# Build with env variables sourced
yarn build;

# Load static files into bucket
aws s3 sync $CURRENT_DIR/../build/. s3://$BUCKET_NAME --acl public-read

# Enable Static Web Hosting
aws s3api put-bucket-website --bucket $BUCKET_NAME --website-configuration file://$CURRENT_DIR/website.json

# Invalidate files from CloudFront cache for production deployments.
if \
  [ "$DEPLOY_ENV" = "prod" ] || \
  [ "$DEPLOY_ENV" = "prod-legacy-sync" ]
then
  node $CURRENT_DIR/invalidateCloudFront.js
  if [ $? != 0 ]; then
    echo "CloudFront Invalidation failed"
    exit 1
  fi
fi
