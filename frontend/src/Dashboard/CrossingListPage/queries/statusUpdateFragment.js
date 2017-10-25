import gql from 'graphql-tag';

// Save the fragment into a variable
const statusUpdateFragment = gql`
  fragment statusUpdateInfo on StatusUpdate {
    id
    crossingId
    statusId
    statusReasonId
    statusDurationId
    createdAt
    notes
    userByCreatorId {
      firstName
      lastName
    }
  }
`;

export default statusUpdateFragment;
