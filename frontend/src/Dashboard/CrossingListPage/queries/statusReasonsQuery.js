import gql from 'graphql-tag';

const statusReasonsQuery = gql`
  query allStatusReasons {
    allStatusReasons {
      nodes {
        id
        name
      }
    }
  }
`;

export default statusReasonsQuery;