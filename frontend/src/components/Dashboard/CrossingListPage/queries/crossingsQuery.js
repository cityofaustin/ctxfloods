import gql from 'graphql-tag';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';

const crossingsQuery = gql`
  query searchCrossings($search:String,
                        $showOpen:Boolean,
                        $showClosed:Boolean,
                        $showCaution:Boolean,
                        $showLongterm:Boolean,
                        $pageCursor:Cursor,
                        $orderAsc:Boolean) {
    searchCrossings(
      search: $search
      showOpen: $showOpen
      showClosed: $showClosed
      showCaution: $showCaution
      showLongterm: $showLongterm
      first: 2
      after: $pageCursor
      orderAsc: $orderAsc
    ) {
      totalCount
      pageInfo {
        startCursor
        endCursor
        hasNextPage
        hasPreviousPage
      }
      edges {
        cursor
        node {
          id
          name
          description
          humanAddress
          communityCrossingsByCrossingId {
            nodes {
              communityByCommunityId {
                name
              }
            }
          }
          ...crossingInfo
        }
      }
    }
  }
  ${crossingFragment}
`;

export default crossingsQuery;
