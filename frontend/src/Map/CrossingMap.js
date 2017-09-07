import React from 'react';
import mapboxstyle from './mapboxstyle';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import * as MapboxGl from 'mapbox-gl';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";

const Map = ReactMapboxGl({ accessToken: null });

const STATUS_OPEN = 1;
const STATUS_CLOSED = 2;


class CrossingMap extends React.Component {
  state = {
    selectedCrossingId: -1, // Mapbox filters don't support null values
    center: [null, null]
  }

  onMapboxStyleLoad (map) {
    this.addGeoLocateControl(map);
  }

  onMapClick (map) {
    this.setState({ selectedCrossingId: -1 });
  }

  addGeoLocateControl (map) {
    map.addControl(new MapboxGl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      fitBoundsOptions: {
        maxZoom: 15
      },
      watchPosition: true,
      showUserLocation: true
    }));
  }

  onCrossingClick (crossing) {
    this.setState({ selectedCrossingId: crossing.feature.properties.id });
    this.setState({ center: crossing.feature.geometry.coordinates });
  }

  render () {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }

    if (this.props.data.allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    const allCrossings = this.props.data.allCrossings.nodes;

    return (
      <Map
        onStyleLoad={this.onMapboxStyleLoad.bind(this)}
        onClick={this.onMapClick.bind(this)}
        style={mapboxstyle}
        containerStyle={{
          height: this.props.mapHeight,
          width: this.props.mapWidth,
          display: "block"
        }}
        fitBounds={this.props.viewport}
        center={this.state.center}>
        <Layer
          type="symbol"
          id="closedCrossings"
          layout={{ 'icon-image': 'cross-15', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "id", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_CLOSED]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            onClick={this.onCrossingClick.bind(this)}
                            properties={{"crossingStatus": crossing.statusUpdateByLatestStatusId.statusId}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="openCrossings"
          layout={{ 'icon-image': 'circle-15', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "id", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_OPEN]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            onClick={this.onCrossingClick.bind(this)}
                            properties={{"crossingStatus": crossing.statusUpdateByLatestStatusId.statusId}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedCrossing"
          layout={{ 'icon-image': 'marker-15', 'icon-allow-overlap': true }}
          layerOptions={{"filter": ["==", "id", this.state.selectedCrossingId]}}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            onClick={this.onCrossingClick.bind(this)}/>
              )}
            )
          }
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
        geojson
        statusUpdateByLatestStatusId {
          statusId
        }
      }
    }
  }
`;

export default graphql(allCrossings)(CrossingMap);
