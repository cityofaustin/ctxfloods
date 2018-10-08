#!/usr/bin/env bash
set -o errexit

until psql $DATABASE_INIT_URL -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping ..."
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# run migrations
PGENDPOINT='floodsdb' PGUSERNAME='postgres' PGPASSWORD='password' node ./populateDB/migrate.js

# add setup data
psql $DATABASE_SETUP_URL -f ./populateDB/addSetupData.sql