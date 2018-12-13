import React from 'react';
import PropTypes from 'prop-types';
import * as MapboxGl from 'mapbox-gl';
import ReactMapboxGl, { Layer, Feature } from 'react-mapbox-gl';
import { withRouter } from 'react-router';

import SelectedFeatureContainer from 'components/Shared/CrossingMapPage/SelectedFeatureContainer';
import { MAPBOX_STYLE, MapboxAccessToken } from 'constants/MapboxConstants';
import 'components/Shared/Map/CrossingMap.css';

const Map = ReactMapboxGl({
  accessToken: MapboxAccessToken,
  attributionControl: false,
});

class CrossingMap extends React.Component {
  static propTypes = {
    registerMapResizeCallback: PropTypes.func.isRequired,
  };

  constructor(props, ...args) {
    super(props, ...args);

    this.state = {
      firstLoadComplete: false,
      showDetailsOnMobile: false,
      cachedHeights: {},
    };

    props.registerMapResizeCallback(this.resizeMap);
  }

  componentDidUpdate(prevProps) {
    // This is a slightly strange litle fix here, we used to check loading in render, and not render the map until it loaded
    // that worked well for a single query, but led to the map disappearing on search. I then updated it to hide the crossing
    // layers instead of hiding the whole map on load, but this led to the map not correctly filling the containing div. By checking
    // that it has fully loaded before rendering the first time this problem can be avoided.
    if (!this.state.firstLoadComplete && this.props.isDataLoaded) {
      this.setState({firstLoadComplete: true});
    }

    // Unset showDetailsOnMobile
    if (this.state.showDetailsOnMobile && (
      this.props.selectedFeature !== prevProps.selectedFeature
    )) {
      this.setState({showDetailsOnMobile: false});
    }
  }

  onMapboxStyleLoad = map => {
    this.map = map;

    // add Zoom Control
    map.addControl(new MapboxGl.NavigationControl(), 'bottom-right');

    // add Geolocation Control
    this.addGeoLocateControl(map);

    map.on('click', this.onMapClick);

    // update the map page center on map move
    map.on('dragend', ()=>{
      this.props.setCenter(map.getCenter());
    });

    // disable map rotation using right click + drag
    map.dragRotate.disable();

    // disable map rotation using touch rotation gesture
    map.touchZoomRotate.disableRotation();

    this.props.setMapLoaded();
  };

  addGeoLocateControl(map) {
    const geolocateControl = new MapboxGl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true,
      },
      fitBoundsOptions: {
        maxZoom: 10,
      },
      showUserLocation: true,
    });

    map.addControl(geolocateControl, 'bottom-right');

    // New versions of mapboxgl-js will have a trigger function instead
    // https://github.com/mapbox/mapbox-gl-js/issues/5464
    if (this.props.autoGeoLocate) {
      if (geolocateControl.trigger) {
        geolocateControl.trigger();
      } else {
        setTimeout(() => geolocateControl._onClickGeolocate(), 5);
      }
    }
  }

  flyTo = point => {
    if (this.map) {
      this.map.flyTo({
        center: point,
      });
    }
  };

  onMapClick = e => {
    const map = this.map;
    const { showOpen, showClosed, showCaution, showLongterm, showCameras } = this.props;

    const width = 10;
    const height = 10;
    let layersToQuery = [];
    if (showOpen) layersToQuery.push('openCrossings');
    if (showClosed) layersToQuery.push('closedCrossings');
    if (showCaution) layersToQuery.push('cautionCrossings');
    if (showLongterm) layersToQuery.push('longtermCrossings');
    if (showCameras) layersToQuery.push('allCameras');

    const features = map.queryRenderedFeatures(
      [
        [e.point.x - width / 2, e.point.y - height / 2],
        [e.point.x + width / 2, e.point.y + height / 2],
      ],
      { layers: layersToQuery },
    );

    const feature = features && features[0];
    if (feature) {
      // Handle Camera Clicks
      if (feature.layer.id === 'allCameras') {
        this.props.history.push(`${this.props.onDash ? '/dashboard' : ''}/map/camera/${features[0].properties.cameraId}`);
      // Handle Crossing Clicks
      } else if (feature.properties.crossingId) {
        this.props.history.push(`${this.props.onDash ? '/dashboard' : ''}/map/crossing/${features[0].properties.crossingId}`);
      // Handle Misc Location Clicks
      }
    } else if (this.props.selectedFeature) {
      if (
        this.props.selectedFeature.type === "Crossing" ||
        this.props.selectedFeature.type === "Camera"
      ) {
        this.props.history.push(`${this.props.onDash ? '/dashboard' : ''}/map/`)
      } else if (this.props.selectedFeature.type === 'Misc') {
        this.props.setSelectedFeature(null);
      }
    }
  };

  onZoom = map => {
    const iconSize = map.getZoom() < 11 ? 'mini' : 'small';
    if (iconSize !== this.state.iconSize) {
      this.setState({ iconSize });
    }
  };

  resizeMap = () => {
    if (this.map) {
      this.map.resize();
    }
  };

  setDetailsHeight = (crossingId, statusReasonId, reopenDate, indefiniteClosure, notes) => {
    // Let's hack this together so it makes some kinda sense
    // and we can figure out how much to offset the map
    // for the details popup
    const { cachedHeights } = this.state;
    const map = this.map;

    // First, let's get the size of the map in pixels
    const mapHeightInPixels = map.getContainer().offsetHeight;

    // Then, let's get the size on the popup in pixels
    let popupHeightInPixels;

    // STUPID HACK - guess the height using crossing data
    if (cachedHeights[crossingId]) {
      popupHeightInPixels = cachedHeights[crossingId];
    } else {
      popupHeightInPixels = 40;
      if (statusReasonId) popupHeightInPixels += 40;
      if (reopenDate || indefiniteClosure) popupHeightInPixels += 40;

      // STUPID HACK CONT. - we use about 20 chars per line
      if (notes)
        popupHeightInPixels += (Math.floor(notes.length / 20) - 1) * 20;

      // STUPID HACK CONT. - cache the heights because our
      // componentDidUpdate logic in SelectedCrossingContainer
      // is having issues when we've already clicked a crossing
      cachedHeights[crossingId] = popupHeightInPixels;
      this.setState({ cachedHeights: cachedHeights });
    }

    // Now let's get the ratio of popup height to map height
    const relativePopupSize = popupHeightInPixels / mapHeightInPixels;

    // Then we need to get the size of the map in latitude
    const mapHeightInLat =
      map.getBounds().getNorth() - map.getBounds().getSouth();

    // Now we need to calculate our offset using the ratio and the
    // height of the map in lat
    const offset = mapHeightInLat * relativePopupSize / 2;

    // And then apply it to the coordinates
    const coordinates = [
      JSON.parse(this.state.selectedCrossing.geojson).coordinates[0],
      JSON.parse(this.state.selectedCrossing.geojson).coordinates[1] + offset,
    ];

    this.flyTo(coordinates);
  };

  setShowDetailsOnMobile = () => {
    this.setState({ showDetailsOnMobile: true });

    const { cachedHeights, selectedCrossingId } = this.state;

    if (cachedHeights[selectedCrossingId])
      this.setDetailsHeight(selectedCrossingId);
  };

  render() {
    if (!this.state.firstLoadComplete) return null;

    const {
      showOpen,
      showClosed,
      showCaution,
      showLongterm,
      openCrossings,
      closedCrossings,
      cautionCrossings,
      longtermCrossings,
      showCameras,
      allCameras,
      center,
      onDash,
      selectedFeature,
    } = this.props;

    console.log("What is selectedFeature?", selectedFeature)

    // mapbox expressions can't compare null values
    let selectedCrossingId = -1;
    let selectedCameraId = -1;

    if (selectedFeature) {
      if (selectedFeature.type === "Crossing") {
        selectedCrossingId = selectedFeature.data.id;
      } else if (selectedFeature.type === "Camera") {
        selectedCameraId = selectedFeature.data.cameraId;
      }
    }

    const crossingSettings = [
      {
        condition: showOpen,
        layerId: "openCrossings",
        iconImage: `marker-open-${this.state.iconSize}`,
        crossings: openCrossings,
      }, {
        condition: showClosed,
        layerId: "closedCrossings",
        iconImage: `marker-closed-${this.state.iconSize}`,
        crossings: closedCrossings,
      }, {
        condition: showCaution,
        layerId: "cautionCrossings",
        iconImage: `marker-caution-${this.state.iconSize}`,
        crossings: cautionCrossings,
      }, {
        condition: showLongterm,
        layerId: "longtermCrossings",
        iconImage: `marker-long-term-${this.state.iconSize}`,
        crossings: longtermCrossings
      }
    ]

    return (
      <Map
        onStyleLoad={this.onMapboxStyleLoad}
        // eslint-disable-next-line
        style={MAPBOX_STYLE}
        containerStyle={{
          height: this.props.mapHeight,
          width: this.props.mapWidth,
          display: 'block',
        }}
        fitBounds={this.props.viewport}
        center={center}
        onZoom={this.onZoom}
      >
        {crossingSettings.map(settings=>{
          return settings.condition && (
            <Layer
              type="symbol"
              key={settings.layerId}
              id={settings.layerId}
              layout={{
                'icon-image': settings.iconImage,
                'icon-allow-overlap': true,
              }}
              filter={['!=', 'crossingId', selectedCrossingId]}
            >
              {settings.crossings && settings.crossings.map((crossing, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(crossing.geojson).coordinates}
                    properties={{
                      latestStatusId: crossing.latestStatusId,
                      crossingId: crossing.id,
                      geojson: crossing.geojson,
                      latestStatusCreatedAt: crossing.latestStatusCreatedAt,
                      crossingName: crossing.name,
                      communityIds: crossing.communityIds,
                    }}
                  />
                );
              })}
            </Layer>
          )
        })}
        {showCameras && (
          <Layer
            type="symbol"
            id="allCameras"
            layout={{
              'icon-image': `camera-${this.state.iconSize}`,
              'icon-allow-overlap': true,
            }}
            filter={['!=', 'cameraId', selectedCameraId]}
          >
            {allCameras &&
              allCameras.map((camera, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(camera.geojson).coordinates}
                    properties={{
                      cameraId: camera.cameraId,
                      geojson: camera.geojson,
                      cameraName: camera.name,
                    }}
                  />
                );
              })}
          </Layer>
        )}
        <SelectedFeatureContainer
          selectedFeature={selectedFeature}
          iconSize={this.state.iconSize}
          mobile={this.props.mobile}
          showDetailsOnMobile={this.state.showDetailsOnMobile}
          setShowDetailsOnMobile={this.setShowDetailsOnMobile}
          onDash={onDash}
        />
      </Map>
    );
  }
}

export default withRouter(CrossingMap);
