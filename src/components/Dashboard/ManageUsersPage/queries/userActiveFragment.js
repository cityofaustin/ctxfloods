import gql from 'graphql-tag';

// Save the fragment into a variable
const userActiveFragment = gql`
  fragment userActive on User {
    id
    active
  }
`;

export default userActiveFragment;
