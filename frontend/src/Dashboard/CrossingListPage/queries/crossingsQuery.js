import gql from 'graphql-tag';
import statusUpdateFragment from './statusUpdateFragment';

const crossingsQuery = gql`
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        description
        humanAddress
        latestStatusId
        statusUpdateByLatestStatusUpdateId {
          ...statusUpdateInfo
        }
        communityCrossingsByCrossingId {
          nodes {
            communityByCommunityId {
              name
            }
          }
        }
      }
    }
  }
  ${statusUpdateFragment}
`;

export default crossingsQuery;
