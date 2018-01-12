import React from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import * as MapboxGl from 'mapbox-gl';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import { ZoomControl } from "react-mapbox-gl";
import allCrossings from 'components/Map/queries/allCrossingsQuery';

const Map = ReactMapboxGl({ accessToken: null });

const STATUS_OPEN = 1;
const STATUS_CLOSED = 2;
const STATUS_CAUTION = 3;
const STATUS_LONGTERM = 4;

class CrossingMap extends React.Component {
  state = {
    selectedCrossingId: -1, // Mapbox filters don't support null values
    selectedCrossing: null,
    selectedCrossingCoordinates: null,
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
        this.setState({selectedCrossingId: -1});
        this.setState({selectedCrossing: null });
      }
    }

    const { selectedCrossing } = this.state;
    if (selectedCrossing && nextProps.selectedCrossingStatus && (nextProps.selectedCrossingStatus != selectedCrossing.crossingStatus) ) {
      selectedCrossing.crossingStatus = nextProps.selectedCrossingStatus;
      this.setState({selectedCrossing: selectedCrossing});
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
     map.on('click', this.onMapClick);
  }

  onCrossingClick = (crossing) => {
    this.setState({ selectedCrossingId: crossing.properties.crossingId });
    this.setState({ selectedCrossing: crossing.properties });
    this.setState({ selectedCrossingCoordinates: crossing.geometry.coordinates });
    this.setState({ center: crossing.geometry.coordinates });
    this.props.selectCrossing(crossing.properties.crossingId, crossing.properties.crossingStatus);
  }

  onMapClick = (e) => {
    const { map } = this.state;
    const features = map.queryRenderedFeatures(e.point);

    if (features && features[0] && features[0].properties.crossingId) {
      this.onCrossingClick(features[0]);
    } else {
      this.setState({ selectedCrossingId: -1 });
      this.setState({ selectedCrossing: null });
      this.setState({ selectedCrossingCoordinates: null });
      this.props.selectCrossing(null, null);      
    }
  }

  render () {
    const isLoading = (
      !this.props.openCrossings || this.props.openCrossings.loading ||
      !this.props.closedCrossings || this.props.closedCrossings.loading ||
      !this.props.cautionCrossings || this.props.cautionCrossings.loading ||
      !this.props.longtermCrossings || this.props.longtermCrossings.loading
    );

    if ( isLoading ) {
      return (<div>Loading</div>)
    }

    if (this.props.openCrossings.allCrossings == null ||
        this.props.closedCrossings.allCrossings == null ||
        this.props.cautionCrossings.allCrossings == null ||
        this.props.longtermCrossings.allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    const openCrossings = this.props.openCrossings.allCrossings.nodes;
    const closedCrossings = this.props.closedCrossings.allCrossings.nodes;
    const cautionCrossings = this.props.cautionCrossings.allCrossings.nodes;
    const longtermCrossings = this.props.longtermCrossings.allCrossings.nodes;

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
            ]
          }}
          >
          {
            longtermCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id, "geojson": crossing.geojson}}/>
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
            ]
          }}
          >
          {
            cautionCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id, "geojson": crossing.geojson}}/>
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
            ]
          }}
          >
          {
            closedCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id, "geojson": crossing.geojson}}/>
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
            ]
          }}
          >
          {
            openCrossings.map((crossing, i) => {
              return(
                   <Feature key={i}
                            coordinates={JSON.parse(crossing.geojson).coordinates}
                            properties={{"crossingStatus": crossing.latestStatusId, "crossingId": crossing.id, "geojson": crossing.geojson}}/>
              )}
            )
          }
        </Layer>

        <Layer
          type="symbol"
          id="selectedLongtermCrossing"
          layout={{ 'icon-image': 'longterm_selected', 'icon-allow-overlap': true }}
          >
          { (this.state.selectedCrossing && (this.state.selectedCrossing.crossingStatus == STATUS_LONGTERM)) ?
              <Feature key={1}
                coordinates={JSON.parse(this.state.selectedCrossing.geojson).coordinates}
                properties={{"crossingStatus": this.state.selectedCrossing.crossingStatus, "crossingId": this.state.selectedCrossing.crossingId, "geojson": this.state.selectedCrossing.geojson}} />
            : null
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedCautionCrossing"
          layout={{ 'icon-image': 'caution_selected', 'icon-allow-overlap': true }}
          >
          { (this.state.selectedCrossing && (this.state.selectedCrossing.crossingStatus == STATUS_CAUTION)) ?
              <Feature key={1}
                coordinates={JSON.parse(this.state.selectedCrossing.geojson).coordinates}
                properties={{"crossingStatus": this.state.selectedCrossing.crossingStatus, "crossingId": this.state.selectedCrossing.crossingId, "geojson": this.state.selectedCrossing.geojson}} />
            : null
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedClosedCrossing"
          layout={{ 'icon-image': 'closed_selected', 'icon-allow-overlap': true }}
          >
          { (this.state.selectedCrossing && (this.state.selectedCrossing.crossingStatus == STATUS_CLOSED)) ?
              <Feature key={1}
                coordinates={JSON.parse(this.state.selectedCrossing.geojson).coordinates}
                properties={{"crossingStatus": this.state.selectedCrossing.crossingStatus, "crossingId": this.state.selectedCrossing.crossingId, "geojson": this.state.selectedCrossing.geojson}} />
            : null
          }
        </Layer>
        <Layer
          type="symbol"
          id="selectedOpenCrossing"
          layout={{ 'icon-image': 'open_selected', 'icon-allow-overlap': true }}
          >
          { (this.state.selectedCrossing && (this.state.selectedCrossing.crossingStatus == STATUS_OPEN)) ?
              <Feature key={1}
                coordinates={JSON.parse(this.state.selectedCrossing.geojson).coordinates}
                properties={{"crossingStatus": this.state.selectedCrossing.crossingStatus, "crossingId": this.state.selectedCrossing.crossingId, "geojson": this.state.selectedCrossing.geojson}} />
            : null
          }
        </Layer>
      </Map>
    );
  }

}

export default compose(
  graphql(allCrossings, {
    name: 'openCrossings',
    options: {
      variables: {
        statusId: STATUS_OPEN
      }
    }
  }),
  graphql(allCrossings, {
    name: 'closedCrossings',
    options: {
      variables: {
        statusId: STATUS_CLOSED
      }
    }
  }),
  graphql(allCrossings, {
    name: 'cautionCrossings',
    options: {
      variables: {
        statusId: STATUS_CAUTION
      }
    }
  }),
  graphql(allCrossings, {
    name: 'longtermCrossings',
    options: {
      variables: {
        statusId: STATUS_LONGTERM
      }
    }
  })
)(CrossingMap);
