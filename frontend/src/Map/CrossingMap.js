import React from 'react';
import mapboxstyle from './mapboxstyle';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";

const Map = ReactMapboxGl({ accessToken: null });

class CrossingMap extends React.Component {

  render () {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }

    if (this.props.data.allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    return (
      <Map
        style={mapboxstyle}
        containerStyle={{
          height: "80vh",
          width: "80vw",
          display: "block"
        }}
        center={[ -97.7237, 30.2328 ]}>
        <Layer
          type="symbol"
          id="marker"
          layout={{ 'icon-image': 'cross-15' }}
          >
          <Feature coordinates={[ -97.7237, 30.2328 ]}/>
        </Layer>
      </Map>
    );
  }

}

const allCrossings = gql`
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        latestStatus {
          statusByStatusId {
            name
          }
          notes
          userByCreatorId {
            id
            firstName
            lastName
          }
        }
      }
    }
  }
`;

export default graphql(allCrossings)(CrossingMap);
