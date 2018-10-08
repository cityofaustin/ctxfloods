# #!/usr/bin/env bash

set -o errexit

if [ "$REBUILD" == "on" ]; then
    docker build --no-cache -f Dockerfile -t ctxfloods-frontend .
    docker build --no-cache -f Dockerfile.backend -t ctxfloods-backend .
    docker-compose -f docker-compose.yml up --build
else
    docker build -f Dockerfile -t ctxfloods-frontend .
    docker build -f Dockerfile.backend -t ctxfloods-backend .
    docker-compose -f docker-compose.yml up
fi