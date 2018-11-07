# # When the database schema changes, you must do two steps for that information
# # to propagate to the frontend's schema.graphql
# # 1. Run yarn build-schema on the backend
# # 2. Run get-graphql-schema on a running backend server
# #    The backend can either by run manually or with the first part of this script.
# # TODO: automate this step better.
#
# # Run yarn to make sure we have the backend in node modules
# yarn;
#
# # Spin up the backend
# cd node_modules/ctxfloods-backend;
# yarn;
# yarn init-local-db;
# # yarn local-drop-rebuild;
# yarn start-express-server &
# cd ../..;
#
# # Make sure the server is running
# timeout 15 bash -c 'until echo > /dev/tcp/localhost/5000; do sleep 0.5; done'

# Get the schema
get-graphql-schema http://localhost:5000/graphql > ./src/stories/schema/schema.graphql;
echo "const schema = \`" > ./src/stories/schema/schema.js;
sed "s/\`/\'/g" ./src/stories/schema/schema.graphql >> ./src/stories/schema/schema.js;
echo "\`; export default schema;" >> ./src/stories/schema/schema.js;

# Shut down the backend
kill $(ps aux | grep 'node localServer.js' | grep -v 'grep' | awk '{print $2}');
