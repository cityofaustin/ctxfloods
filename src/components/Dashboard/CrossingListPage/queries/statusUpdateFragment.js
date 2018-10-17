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
      statusDurationId
      createdAt
      notes
      image
      userByCreatorId {
        firstName
        lastName
      }
    }
  }
`;

export default statusUpdateFragment;
