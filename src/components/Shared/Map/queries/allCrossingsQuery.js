import gql from 'graphql-tag';

/**
  $communityId must be explicitly added in order for DashboardCrossingListItme.updateMap() to not throw errors.
  updateMap() reruns all searchCrossings queries from store.data.data with this query.
**/
const allCrossings = gql`
  query allCrossings(
    $search: String
    $communityId: Int
    $showOpen: Boolean
    $showClosed: Boolean
    $showCaution: Boolean
    $showLongterm: Boolean
  ) {
    searchCrossings(
      search: $search
      communityId: $communityId
      showOpen: $showOpen
      showClosed: $showClosed
      showCaution: $showCaution
      showLongterm: $showLongterm
    ) {
      nodes {
        id
        name
        geojson
        latestStatusId
        latestStatusCreatedAt
        communityIds
      }
    }
  }
`;

export default allCrossings;
