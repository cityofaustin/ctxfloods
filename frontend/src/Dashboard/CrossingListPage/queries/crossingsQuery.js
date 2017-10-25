import gql from 'graphql-tag';
import crossingFragment from './crossingFragment';

const crossingsQuery = gql`
  query allCrossings {
    allCrossings {
      nodes {
        ...crossingInfo
      }
    }
  }
  ${crossingFragment}
`;

export default crossingsQuery;
