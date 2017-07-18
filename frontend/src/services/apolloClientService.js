import ApolloClient, { createNetworkInterface } from 'apollo-client';

const networkInterface = createNetworkInterface({
  uri: `http://localhost:5000/graphql`,
});

networkInterface.use([{
  applyMiddleware(req, next) {
    if (!req.options.headers) {
      req.options.headers = {};  // Create the header object if needed.
    }
    if (localStorage.getItem('jwt_user_token')) {
      req.options.headers.Authorization = `Bearer ${localStorage.getItem('jwt_user_token')}`;
    }
    next();
  },
}]);

const client = new ApolloClient({
  networkInterface,
});

export default client;
