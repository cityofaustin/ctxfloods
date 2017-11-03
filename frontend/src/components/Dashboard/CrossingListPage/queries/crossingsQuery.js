import gql from 'graphql-tag';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';

const crossingsQuery = gql`
  query searchCrossings($search:String){
    searchCrossings(
      search: $search
    ) {
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
