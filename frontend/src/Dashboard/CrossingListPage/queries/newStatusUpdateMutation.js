import gql from 'graphql-tag';
import statusUpdateFragment from './statusUpdateFragment';

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
        ...statusUpdateInfo
      }
    }
  }
  ${statusUpdateFragment}
`;

export default newStatusUpdateMutation;
