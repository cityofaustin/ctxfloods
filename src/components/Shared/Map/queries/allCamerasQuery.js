import gql from 'graphql-tag';

const allCameras = gql`
  query {
    allCameras{
      nodes {
        id
        sourceId
        name
        geojson
      }
    }
  }
`;

export default allCameras;
