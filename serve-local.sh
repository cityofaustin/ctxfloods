# #!/usr/bin/env bash

set -o errexit

if [ "$REBUILD" == "on" ]; then
    docker build --no-cache -f Dockerfile -t ctxfloods-frontend .
    docker-compose -f docker-compose.yml up --build
else
    docker build -f Dockerfile -t ctxfloods-frontend .
    docker-compose -f docker-compose.yml up
fi

# #!/usr/bin/env bash
# echo "starting..."

# set -o errexit

# TAG='ctxfloods:local'
# echo "building docker image..."
# docker build --tag "$TAG" .
# echo "running docker image..."
# HOST_IP=$(ifconfig en0 | awk '$1 == "inet" {print $2}')

# docker run \
#     --rm \
#     --name ctxfloods \
#     --tty --interactive \
#     --publish 3000:80 \
#     --volume "$PWD/src:/app/src" \
#     --volume "$PWD/yarn.lock:/app/yarn.lock" \
#     --volume "$PWD/package.json:/app/package.json" \
#     --env "REACT_APP_BACKEND_URL=http://$HOST_IP:5000" \
#     "$TAG" "$@"