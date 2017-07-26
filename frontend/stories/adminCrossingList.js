import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';


storiesOf('Admin Crossing List', module)
  .add('with text', () => (
    <AdminCrossingList/>
  ));


import React from 'react';
import { storiesOf } from '@storybook/react';
import { withApolloProvider } from 'storybook-addon-apollo-graphql';
import { gql, graphql } from 'react-apollo';
import AdminCrossingList from '../src/AdminCrossingList';

const schema = `
    type Query {
        random: Int!
    }
`;

const root = {
  random: () => Math.floor(Math.random() * 10),
};


storiesOf('Random Number', module)
  .addDecorator(withApolloProvider({ schema, root }))
  .add('A random number query', () => <ComponentWithGraphql />);
