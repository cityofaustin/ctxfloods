import gql from 'graphql-tag';

const allCameras = gql`
  query {
    getAllCamerasWithLatestPhoto {
    	nodes {
        id
        source
        name
        geojson
        latestPhotoUrl
        uploadedAt
      }
    }
  }
`;

export default allCameras;
