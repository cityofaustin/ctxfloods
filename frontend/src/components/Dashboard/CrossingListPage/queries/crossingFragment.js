import gql from 'graphql-tag';
import updateCrossingFragment from 'components/Dashboard/CrossingListPage/queries/updateCrossingFragment';

// Save the fragment into a variable
const crossingFragment = gql`
  fragment crossingInfo on Crossing {
    id
    ...updateCrossingInfo
    name
    description
    humanAddress
    geojson
    communityIds
    ...deleteCrossingInfo
    communities {
      nodes {
        id
        name
      }
    }
  }
  ${updateCrossingFragment}
`;

export default crossingFragment;
