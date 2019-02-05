import gql from 'graphql-tag';

const statusHistoryQuery = gql`
  query getStatusUpdateHistory(
    $crossingId: Int
    $communityId: Int
    $dateLowerBound: Datetime
    $dateUpperBound: Datetime
    $idUpperBound: Int
    $rowLimit: Int
  ) {
    getStatusUpdateHistory(
      crossingId: $crossingId
      communityId: $communityId
      dateLowerBound: $dateLowerBound
      dateUpperBound: $dateUpperBound
      idUpperBound: $idUpperBound
      rowLimit: $rowLimit
    ){
      edges {
        node {
          statusUpdateId,
          userId,
          userLastName,
          userFirstName,
          statusId,
          statusName,
          statusReasonName,
          reopenDate,
          indefiniteClosure,
          createdAt,
          notes,
          crossingId,
          crossingName,
          crossingHumanAddress,
          geojson,
          communities
        }
      }
    }
  }
`;

export default statusHistoryQuery;
