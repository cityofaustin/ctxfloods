import gql from 'graphql-tag';

const allCameras = gql`
  query {
    getAllCamerasWithLatestPhoto {
    	nodes {
        cameraId
        source
        name
        geojson
        url
        uploadedAt
      }
    }
  }
`;

export default allCameras;
