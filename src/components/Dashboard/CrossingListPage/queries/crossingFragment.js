import gql from 'graphql-tag';
import updateCrossingFragment from 'components/Dashboard/CrossingListPage/queries/updateCrossingFragment';
import deleteCrossingFragment from 'components/Dashboard/CrossingListPage/queries/deleteCrossingFragment';
import addCrossingToCommunityFragment from 'components/Dashboard/CrossingListPage/queries/addCrossingToCommunityFragment';
import crossingCameraFragment from 'components/Dashboard/CrossingListPage/queries/crossingCameraFragment';

// Save the fragment into a variable
const crossingFragment = gql`
  fragment crossingInfo on Crossing {
    id
    ...updateCrossingInfo
    name
    description
    humanAddress
    geojson
    ...addCrossingToCommunityInfo
    ...deleteCrossingInfo
    ...crossingCameraInfo
  }
  ${updateCrossingFragment}
  ${deleteCrossingFragment}
  ${addCrossingToCommunityFragment}
  ${crossingCameraFragment}
`;

export default crossingFragment;
