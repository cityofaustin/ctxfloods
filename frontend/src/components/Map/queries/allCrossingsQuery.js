import gql from 'graphql-tag';

const allCrossings = gql`
  query allCrossings($statusId:Int) {
    allCrossings(condition: {latestStatusId: $statusId}) {
      nodes {
        id
        geojson
        latestStatusId
        communityIds
      }
    }
  }
`;

export default allCrossings;
