import React from 'react';
import Crossing from './Crossing';
import mapboxstyle from './mapboxstyle';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import ReactMapboxGl from "react-mapbox-gl";

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
          height: "100vh",
          width: "100vw"
        }}>
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
