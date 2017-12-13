import gql from 'graphql-tag';

const CrossingByIdQuery = gql`
  query crossingById($crossingId:Int!) {
    crossingById(id:$crossingId) {
      id
      name
      geojson
      humanCoordinates
      humanAddress
      description
      statusByLatestStatusId {
        id
        name
      }
      communityCrossingsByCrossingId {
        nodes {
          communityByCommunityId {
            id
            name
          }
        }
      }
    }
  }
`;

export default CrossingByIdQuery;
