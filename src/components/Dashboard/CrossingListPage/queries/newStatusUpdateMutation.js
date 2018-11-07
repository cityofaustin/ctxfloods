import gql from 'graphql-tag';
import statusUpdateFragment from 'components/Dashboard/CrossingListPage/queries/statusUpdateFragment';

const newStatusUpdateMutation = gql`
  mutation newStatusUpdate(
    $crossingId: Int
    $statusId: Int
    $reasonId: Int
    $reopenDate: Date
    $indefiniteClosure: Boolean
    $notes: String
  ) {
    newStatusUpdate(
      input: {
        crossingId: $crossingId
        statusId: $statusId
        statusReasonId: $reasonId
        reopenDate: $reopenDate
        indefiniteClosure: $indefiniteClosure
        notes: $notes
      }
    ) {
      statusUpdate {
        crossingId
        crossingByCrossingId {
          name
          geojson
          communityIds
          ...statusUpdateInfo
        }
      }
    }
  }
  ${statusUpdateFragment}
`;

export default newStatusUpdateMutation;
