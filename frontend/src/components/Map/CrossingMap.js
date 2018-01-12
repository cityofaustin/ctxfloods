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
const STATUS_CAUTION = 3;
const STATUS_LONGTERM = 4;

class CrossingMap extends React.Component {
  state = {
    selectedCrossingId: -1, // Mapbox filters don't support null values
    selectedCrossingCoordinates: null,
    justClickedACrossing: false,
    center: [
      (this.props.viewport[0][0]+this.props.viewport[1][0])/2,
      (this.props.viewport[0][1]+this.props.viewport[1][1])/2
    ]
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.selectedCrossingId != this.props.selectedCrossingId) {
      if (nextProps.selectedCrossingId) {
        this.setState({selectedCrossingId: nextProps.selectedCrossingId})
      } else {
        this.setState({selectedCrossingId: -1})
      }
    }
  }

  onMapboxStyleLoad = (map) => {
    this.setState({ map: map });
    this.addGeoLocateControl(map);
    this.addCrossingClickHandlers(map);
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
     map.on('click', 'cautionCrossings', this.onCrossingClick);
     map.on('click', 'longtermCrossings', this.onCrossingClick);
     map.on('click', this.onMapClick);
  }

  onCrossingClick = (e) => {
    const crossing = e.features[0];
    this.setState({ selectedCrossingId: crossing.properties.crossingId });
    this.setState({ selectedCrossingCoordinates: crossing.geometry.coordinates });
    this.setState({ center: crossing.geometry.coordinates });
    this.props.selectCrossing(crossing.properties.crossingId);

    // slightly ugly fix for multiple events
    this.setState({justClickedACrossing: true});
  }

  onMapClick = (e) => {
    // slightly ugly fix for multiple events
    // if we already clicked a crossing, we don't want to do the click off stuff
    if(this.state.justClickedACrossing) {
      this.setState({justClickedACrossing: false});
      return;
    }

    this.setState({ selectedCrossingId: -1 });
    this.setState({ selectedCrossingCoordinates: null });
    this.props.selectCrossing(null);
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
          id="longtermCrossings"
          layout={{ 'icon-image': 'longterm', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_LONGTERM]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="cautionCrossings"
          layout={{ 'icon-image': 'caution', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_CAUTION]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="closedCrossings"
          layout={{ 'icon-image': 'closed', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_CLOSED]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="openCrossings"
          layout={{ 'icon-image': 'open', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["!=", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_OPEN]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedLongtermCrossing"
          layout={{ 'icon-image': 'longterm_selected', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["==", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_LONGTERM]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedCautionCrossing"
          layout={{ 'icon-image': 'caution_selected', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["==", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_CAUTION]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedClosedCrossing"
          layout={{ 'icon-image': 'closed_selected', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["==", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_CLOSED]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
              )}
            )
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedOpenCrossing"
          layout={{ 'icon-image': 'open_selected', 'icon-allow-overlap': true }}
          layerOptions={{"filter":
            [
              "all",
              ["==", "crossingId", this.state.selectedCrossingId],
              ["==", "crossingStatus", STATUS_OPEN]
            ]
          }}
          >
          {
            allCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id}}/>
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
        latestStatusId
      }
    }
  }
`;

export default graphql(allCrossings)(CrossingMap);
