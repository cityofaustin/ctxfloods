import gql from 'graphql-tag';

// Save the fragment into a variable
const communityFragment = gql`
  fragment communityInfo on Community {
    id
    name
    viewportgeojson
  }
`;

export default communityFragment;
