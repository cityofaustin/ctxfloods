import React from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import * as MapboxGl from 'mapbox-gl';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import { ZoomControl } from "react-mapbox-gl";

const Map = ReactMapboxGl({ accessToken: null });

const STATUS_OPEN = 1;
const STATUS_CLOSED = 2;


class CrossingMap extends React.Component {
  state = {
    selectedCrossingId: -1, // Mapbox filters don't support null values
    center: [
      (this.props.viewport[0][0]+this.props.viewport[1][0])/2,
      (this.props.viewport[0][1]+this.props.viewport[1][1])/2
    ]
  }

  onMapboxStyleLoad = (map) => {
    this.addGeoLocateControl(map);
    this.addCrossingClickHandlers(map);
  }

  onMapClick = (map) => {
    this.setState({ selectedCrossingId: -1 });
  }

  addGeoLocateControl (map) {
    const geolocateControl = new MapboxGl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      fitBoundsOptions: {
        maxZoom: 15
      },
      watchPosition: true,
      showUserLocation: true
    });

    map.addControl(geolocateControl, 'top-left');
  }

  addCrossingClickHandlers (map) {
     map.on('click', 'closedCrossings', this.onCrossingClick);
     map.on('click', 'openCrossings', this.onCrossingClick);
  }

  onCrossingClick = (e) => {
    const crossing = e.features[0];
    this.setState({ selectedCrossingId: crossing.properties.id });
    this.setState({ center: crossing.geometry.coordinates });
  }

  render () {
    const isLoading = (
      !this.props.data || this.props.data.loading
    );

    if ( isLoading ) {
      return (<div>Loading</div>)
    }

    if (this.props.data.allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    const allCrossings = this.props.data.allCrossings.nodes;

    return (
      <Map
        onStyleLoad={this.onMapboxStyleLoad}
        onClick={this.onMapClick}
        style={mapboxstyle}
        containerStyle={{
          height: this.props.mapHeight,
          width: this.props.mapWidth,
          display: "block"
        }}
        fitBounds={this.props.viewport}
        center={this.state.center}>
        <ZoomControl />
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
                            properties={{"crossingStatus": crossing.statusUpdateByLatestStatusUpdateId.statusId}}/>
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
                            properties={{"crossingStatus": crossing.statusUpdateByLatestStatusUpdateId.statusId}}/>
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
                            onClick={this.onCrossingClick}/>
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
        statusUpdateByLatestStatusUpdateId {
          statusId
        }
      }
    }
  }
`;

export default graphql(allCrossings)(CrossingMap);
