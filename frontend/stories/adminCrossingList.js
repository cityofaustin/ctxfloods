// import React from 'react';
// import { storiesOf } from '@storybook/react';
// import { withApolloProvider } from 'storybook-addon-apollo-graphql';
// import { gql, graphql } from 'react-apollo';
// import AdminCrossingList from '../src/AdminCrossingList';
// import { action } from '@storybook/addon-actions';


// storiesOf('Admin Crossing List', module)
//   .add('with text', () => (
//     <AdminCrossingList/>
//   ));

import React from 'react';
import { storiesOf } from '@storybook/react';
import { withApolloProvider } from 'storybook-addon-apollo-graphql';
import { gql, graphql } from 'react-apollo';
 
const Component = ({ data: { random } }) => <div>{random}</div>;
const ComponentWithGraphql = graphql(gql`{ random }`)(Component);

const schema = `
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        latestStatus {
          statusByStatusId {
            name
          }
          notes
          userByCreatorId {
            id
            firstName
            lastName
          }
        }
      }
    }
  }
`;
 
const root = {
  random: () => Math.floor(Math.random() * 10),
};
 
export default () => {
  storiesOf('Random Number', module)
    .addDecorator(withApolloProvider({ schema, root }))
    .add('A random number query', () => <ComponentWithGraphql />);
};
