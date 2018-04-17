import gql from 'graphql-tag';

// Save the fragment into a variable
const crossingCameraFragment = gql`
  fragment crossingCameraInfo on Crossing {
    id
    cameraId
    cameraType
  }
`;

export default crossingCameraFragment;
