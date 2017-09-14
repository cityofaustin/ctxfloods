import React from 'react';
import { storiesOf } from '@storybook/react';
import { withApolloProvider } from 'storybook-addon-apollo-graphql';
import { gql, graphql } from 'react-apollo';
import CrossingList from '../src/Dashboard/List/CrossingList';
import schema from './schema/schema';

// fake db
const crossingNodes = {
  1: {

    }
  }
};

const root = {
  searchCrossings: () => ({ nodes: Object.values(crossingNodes) }),
};

storiesOf('List Crossings', module)
  .addDecorator(withApolloProvider({ schema, root }))
  .add('List Crossings', () => <CrossingList/>);
