import gql from 'graphql-tag';

const AllCommunitiesQuery = gql`
  query allCommunities {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`;

export default AllCommunitiesQuery;
