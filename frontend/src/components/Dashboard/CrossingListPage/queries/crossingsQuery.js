import gql from 'graphql-tag';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';

const crossingsQuery = gql`
  query searchCrossings($search:String,
                        $showOpen:Boolean,
                        $showClosed:Boolean,
                        $showCaution:Boolean,
                        $showLongterm:Boolean,
                        $pageCursor:Cursor) {
    searchCrossings(
      search: $search
      showOpen: $showOpen
      showClosed: $showClosed
      showCaution: $showCaution
      showLongterm: $showLongterm
      first: 20
      after: $pageCursor
    ) {
      pageInfo {
        startCursor
        endCursor
        hasNextPage
        hasPreviousPage
      }
      nodes {
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
  ${crossingFragment}
`;

export default crossingsQuery;
