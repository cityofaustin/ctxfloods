import gql from 'graphql-tag';

const newStatusUpdateMutation = gql`
  mutation newStatusUpdate(
    $crossingId: Int,
    $statusId: Int,
    $reasonId: Int,
    $durationId: Int,
    $notes: String
  ) {
    newStatusUpdate(input: 
      {
        crossingId: $crossingId,
        statusId: $statusId,
        statusReasonId: $reasonId,
        statusDurationId: $durationId,
        notes: $notes
      }) {
      statusUpdate {
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
    }
  }
`;

export default newStatusUpdateMutation;
