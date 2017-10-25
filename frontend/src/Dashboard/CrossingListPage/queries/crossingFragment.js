import gql from 'graphql-tag';
import statusUpdateFragment from './statusUpdateFragment';

// Save the fragment into a variable
const crossingFragment = gql`
  fragment crossingInfo on Crossing {
    id
    name
    description
    humanAddress
    latestStatusId
    latestStatusUpdateId
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
  ${statusUpdateFragment}
`;

export default crossingFragment;
