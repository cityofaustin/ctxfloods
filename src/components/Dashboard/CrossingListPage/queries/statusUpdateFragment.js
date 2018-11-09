import gql from 'graphql-tag';

// Save the fragment into a variable
const statusUpdateFragment = gql`
  fragment statusUpdateInfo on Crossing {
    id
    latestStatusId
    latestStatusUpdateId
    latestStatusCreatedAt
    statusUpdateByLatestStatusUpdateId {
      id
      crossingId
      statusId
      statusReasonId
      reopenDate
      indefiniteClosure
      createdAt
      notes
      userByCreatorId {
        firstName
        lastName
      }
    }
  }
`;

export default statusUpdateFragment;
