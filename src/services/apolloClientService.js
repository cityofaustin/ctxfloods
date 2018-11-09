import ApolloClient from 'apollo-client';
import { ApolloLink, from } from 'apollo-link';
import { createHttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';
import { onError } from "apollo-link-error";
import { logError } from './logger';

import { isTokenExpired } from './jwtHelper';

const httpLink = createHttpLink({
  uri: `${process.env.REACT_APP_BACKEND_URL}/graphql`,
});

const errorLink = onError(({ graphQLErrors, networkError, operation, forward }) => {
  // TODO: make an error page for displaying all errors
  logError("graphQLErrors", graphQLErrors);
  logError("networkError", networkError);
  if ( graphQLErrors.name === "JsonWebTokenError") {
    localStorage.removeItem('jwt_user_token');
    window.location.reload(); // Refreshing page will redirect unauthenticated user to the login page.
  }
});

const jwtMiddleware = new ApolloLink((operation, forward) => {
  const token = localStorage.getItem('jwt_user_token');

  if (token !== null && token !== 'null' && !isTokenExpired(token)) {
    operation.setContext({
      headers: {
        authorization: `Bearer ${token}`,
      },
    });
  }

  return forward(operation);
});

const client = new ApolloClient({
  link: from([jwtMiddleware, errorLink, httpLink]),
  cache: new InMemoryCache(),
});

export default client;
