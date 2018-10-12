import React from 'react';
import PropTypes from 'prop-types';
import * as MapboxGl from 'mapbox-gl';
import ReactMapboxGl, { Layer, Feature, Popup } from 'react-mapbox-gl';
import { withRouter } from 'react-router';
import SelectedCrossingContainer from 'components/Shared/CrossingMapPage/SelectedCrossingContainer';

import { MapboxAccessToken } from 'constants/MapboxConstants';

import 'components/Shared/Map/CrossingMap.css';

const Map = ReactMapboxGl({
  accessToken: MapboxAccessToken,
  attributionControl: false,
});

const STATUS_OPEN = 1;
const STATUS_CLOSED = 2;
const STATUS_CAUTION = 3;
const STATUS_LONGTERM = 4;

class CrossingMap extends React.Component {
  static propTypes = {
    registerMapResizeCallback: PropTypes.func.isRequired,
  };

  constructor(props, ...args) {
    super(props, ...args);

    this.state = {
      selectedCrossingId: -1, // Mapbox filters don't support null values
      selectedCrossing: null,
      selectedCrossingCoordinates: null,
      selectedLocationCoordinates: null,
      firstLoadComplete: false,
      showDetailsOnMobile: false,
      cachedHeights: {},
    };

    props.registerMapResizeCallback(this.resizeMap);
  }

  componentWillReceiveProps(nextProps) {
    // If we've selected a crossing
    if (nextProps.selectedCrossingId !== this.props.selectedCrossingId) {
      if (nextProps.selectedCrossingId) {
        this.setState({ selectedCrossingId: nextProps.selectedCrossingId });
        const crossing =
          this.props.openCrossings.find(
            c => c.id === nextProps.selectedCrossingId,
          ) ||
          this.props.closedCrossings.find(
            c => c.id === nextProps.selectedCrossingId,
          ) ||
          this.props.cautionCrossings.find(
            c => c.id === nextProps.selectedCrossingId,
          ) ||
          this.props.longtermCrossings.find(
            c => c.id === nextProps.selectedCrossingId,
          );
        this.selectCrossing(crossing);
      } else {
        this.setState({ selectedCrossingId: -1 });
        this.setState({ selectedCrossing: null });
      }
    }

    const { selectedCrossing } = this.state;
    if (
      selectedCrossing &&
      nextProps.selectedCrossingStatus &&
      nextProps.selectedCrossingStatus !== selectedCrossing.crossingStatus
    ) {
      selectedCrossing.crossingStatus = nextProps.selectedCrossingStatus;
      this.setState({ selectedCrossing: selectedCrossing });
    }

    // If we are selecting a location, fly to it
    if (
      nextProps.selectedLocationCoordinates !==
      this.state.selectedLocationCoordinates
    ) {
      this.setState({
        selectedLocationCoordinates: nextProps.selectedLocationCoordinates,
      });
      if (nextProps.selectedLocationCoordinates) {
        this.flyTo(nextProps.selectedLocationCoordinates);
      }
    }

    // This is a slightly strange litle fix here, we used to check loading in render, and not render the map until it loaded
    // that worked well for a single query, but led to the map disappearing on search. I then updated it to hide the crossing
    // layers instead of hiding the whole map on load, but this led to the map not correctly filling the containing div. By checking
    // that it has fully loaded before rendering the first time this problem can be avoided.
    if (!this.state.firstLoadComplete) {
      const isLoading =
        !nextProps.openCrossings ||
        !nextProps.closedCrossings ||
        !nextProps.cautionCrossings ||
        !nextProps.longtermCrossings;
      this.setState({
        firstLoadComplete: this.state.firstLoadComplete || !isLoading,
      });
    }
  }

  onMapboxStyleLoad = map => {
    this.setState({ map: map });
    this.addZoomControl(map);
    this.addGeoLocateControl(map);
    this.addCrossingClickHandlers(map);

    // update the map page center on map move
    map.on('moveend', this.setCenter);

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

  addZoomControl(map) {
    const zoomControl = new MapboxGl.NavigationControl();
    map.addControl(zoomControl, 'bottom-right');
  }

  addCrossingClickHandlers(map) {
    map.on('click', this.onMapClick);
  }

  setCenter = () => {
    const { map } = this.state;
    const center = map.getCenter();

    this.props.setCenter(center);
  };

  flyTo = point => {
    const { map } = this.state;
    if (map) {
      map.flyTo({
        center: point,
      });
    }
  };

  selectCrossing = crossing => {
    const coordinates = JSON.parse(crossing.geojson).coordinates;

    const mapCrossing = {
      crossingId: crossing.id,
      crossingName: crossing.name,
      crossingStatus: crossing.latestStatusId,
      geojson: crossing.geojson,
    };

    this.setState({
      selectedCrossingCoordinates: coordinates,
      selectedCrossing: mapCrossing,
      showDetailsOnMobile: false,
    });
    this.flyTo(coordinates);
  };

  onCrossingClick = crossing => {
    this.props.history.push(`${this.props.onDash ? '/dashboard' : ''}/map/crossing/${crossing.properties.crossingId}`);
  };

  onMapClick = e => {
    const { map } = this.state;
    const { showOpen, showClosed, showCaution, showLongterm } = this.props;

    const width = 10;
    const height = 10;
    let layersToQuery = [];
    if (showOpen) layersToQuery.push('openCrossings');
    if (showClosed) layersToQuery.push('closedCrossings');
    if (showCaution) layersToQuery.push('cautionCrossings');
    if (showLongterm) layersToQuery.push('longtermCrossings');

    const features = map.queryRenderedFeatures(
      [
        [e.point.x - width / 2, e.point.y - height / 2],
        [e.point.x + width / 2, e.point.y + height / 2],
      ],
      { layers: layersToQuery },
    );

    if (features && features[0] && features[0].properties.crossingId) {
      this.onCrossingClick(features[0]);
    } else {
      this.setState({ selectedCrossingId: -1 });
      this.setState({ selectedCrossing: null });
      this.setState({ selectedCrossingCoordinates: null });
      this.setState({ showDetailsOnMobile: false });

      if (this.props.match.url.includes('dashboard')) {
        this.props.history.push(`/dashboard/map/`);
      } else {
        this.props.history.push(`/map/`);
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
    if (this.state.map) {
      this.state.map.resize();
    }
  };

  setDetailsHeight = (crossingId, statusReasonId, statusDurationId, notes) => {
    // Let's hack this together so it makes some kinda sense
    // and we can figure out how much to offset the map
    // for the details popup
    const { map, cachedHeights } = this.state;

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
      if (statusDurationId) popupHeightInPixels += 40;

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
    const { firstLoadComplete } = this.state;
    if (!firstLoadComplete) return null;

    const {
      showOpen,
      showClosed,
      showCaution,
      showLongterm,
      center,
      openCrossings,
      closedCrossings,
      cautionCrossings,
      longtermCrossings,
      onDash,
    } = this.props;

    return (
      <Map
        onStyleLoad={this.onMapboxStyleLoad}
        // eslint-disable-next-line
        style="mapbox://styles/croweatx/cjeynr3z01k492so57s8lo34o"
        containerStyle={{
          height: this.props.mapHeight,
          width: this.props.mapWidth,
          display: 'block',
        }}
        fitBounds={this.props.viewport}
        center={center}
        onZoom={this.onZoom}
      >
        {showOpen && (
          <Layer
            type="symbol"
            id="openCrossings"
            layout={{
              'icon-image': `marker-open-${this.state.iconSize}`,
              'icon-allow-overlap': true,
            }}
            filter={[
              'all',
              ['!=', 'crossingId', this.state.selectedCrossingId],
            ]}
          >
            {openCrossings &&
              openCrossings.map((crossing, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(crossing.geojson).coordinates}
                    properties={{
                      crossingStatus: crossing.latestStatusId,
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
        )}
        {showLongterm && (
          <Layer
            type="symbol"
            id="longtermCrossings"
            layout={{
              'icon-image': `marker-long-term-${this.state.iconSize}`,
              'icon-allow-overlap': true,
            }}
            filter={[
              'all',
              ['!=', 'crossingId', this.state.selectedCrossingId],
            ]}
          >
            {longtermCrossings &&
              longtermCrossings.map((crossing, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(crossing.geojson).coordinates}
                    properties={{
                      crossingStatus: crossing.latestStatusId,
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
        )}
        {showCaution && (
          <Layer
            type="symbol"
            id="cautionCrossings"
            layout={{
              'icon-image': `marker-caution-${this.state.iconSize}`,
              'icon-allow-overlap': true,
            }}
            filter={[
              'all',
              ['!=', 'crossingId', this.state.selectedCrossingId],
            ]}
          >
            {cautionCrossings &&
              cautionCrossings.map((crossing, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(crossing.geojson).coordinates}
                    properties={{
                      crossingStatus: crossing.latestStatusId,
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
        )}
        {showClosed && (
          <Layer
            type="symbol"
            id="closedCrossings"
            layout={{
              'icon-image': `marker-closed-${this.state.iconSize}`,
              'icon-allow-overlap': true,
            }}
            filter={[
              'all',
              ['!=', 'crossingId', this.state.selectedCrossingId],
            ]}
          >
            {closedCrossings &&
              closedCrossings.map((crossing, i) => {
                return (
                  <Feature
                    key={i}
                    coordinates={JSON.parse(crossing.geojson).coordinates}
                    properties={{
                      crossingStatus: crossing.latestStatusId,
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
        )}
        <Layer
          type="symbol"
          id="selectedLongtermCrossing"
          layout={{
            'icon-image': `marker-long-term-${this.state.iconSize}`,
            'icon-allow-overlap': true,
          }}
        >
          {this.state.selectedCrossing &&
          this.state.selectedCrossing.crossingStatus === STATUS_LONGTERM ? (
            <Feature
              key={1}
              coordinates={
                JSON.parse(this.state.selectedCrossing.geojson).coordinates
              }
              properties={{
                crossingStatus: this.state.selectedCrossing.crossingStatus,
                crossingId: this.state.selectedCrossing.crossingId,
                geojson: this.state.selectedCrossing.geojson,
              }}
            />
          ) : null}
        </Layer>
        <Layer
          type="symbol"
          id="selectedCautionCrossing"
          layout={{
            'icon-image': `marker-caution-${this.state.iconSize}`,
            'icon-allow-overlap': true,
          }}
        >
          {this.state.selectedCrossing &&
          this.state.selectedCrossing.crossingStatus === STATUS_CAUTION ? (
            <Feature
              key={1}
              coordinates={
                JSON.parse(this.state.selectedCrossing.geojson).coordinates
              }
              properties={{
                crossingStatus: this.state.selectedCrossing.crossingStatus,
                crossingId: this.state.selectedCrossing.crossingId,
                geojson: this.state.selectedCrossing.geojson,
              }}
            />
          ) : null}
        </Layer>
        <Layer
          type="symbol"
          id="selectedClosedCrossing"
          layout={{
            'icon-image': `marker-closed-${this.state.iconSize}`,
            'icon-allow-overlap': true,
          }}
        >
          {this.state.selectedCrossing &&
          this.state.selectedCrossing.crossingStatus === STATUS_CLOSED ? (
            <Feature
              key={1}
              coordinates={
                JSON.parse(this.state.selectedCrossing.geojson).coordinates
              }
              properties={{
                crossingStatus: this.state.selectedCrossing.crossingStatus,
                crossingId: this.state.selectedCrossing.crossingId,
                geojson: this.state.selectedCrossing.geojson,
              }}
            />
          ) : null}
        </Layer>
        <Layer
          type="symbol"
          id="selectedOpenCrossing"
          layout={{
            'icon-image': `marker-open-${this.state.iconSize}`,
            'icon-allow-overlap': true,
          }}
        >
          {this.state.selectedCrossing &&
          this.state.selectedCrossing.crossingStatus === STATUS_OPEN ? (
            <Feature
              key={1}
              coordinates={
                JSON.parse(this.state.selectedCrossing.geojson).coordinates
              }
              properties={{
                crossingStatus: this.state.selectedCrossing.crossingStatus,
                crossingId: this.state.selectedCrossing.crossingId,
                geojson: this.state.selectedCrossing.geojson,
              }}
            />
          ) : null}
        </Layer>
        {this.state.selectedCrossing && (
          <Popup
            coordinates={
              JSON.parse(this.state.selectedCrossing.geojson).coordinates
            }
            anchor="bottom"
          >
            <div>
              {this.state.selectedCrossing.crossingName}
              {this.props.mobile &&
                (!this.state.showDetailsOnMobile &&
                  this.state.selectedCrossing.crossingStatus !==
                    STATUS_OPEN) && (
                  <button onClick={() => this.setShowDetailsOnMobile()}>
                    Details
                  </button>
                )}
              {this.state.showDetailsOnMobile && (
                <SelectedCrossingContainer
                  crossingId={this.state.selectedCrossing.crossingId}
                  isMobileDetails={true}
                  onDash={onDash}
                  setHeight={(
                    crossingId,
                    statusReasonId,
                    statusDurationId,
                    notes,
                  ) =>
                    this.setDetailsHeight(
                      crossingId,
                      statusReasonId,
                      statusDurationId,
                      notes,
                    )
                  }
                />
              )}
            </div>
          </Popup>
        )}
        {this.state.selectedLocationCoordinates && (
          <Layer
            type="symbol"
            id="marker"
            layout={{ 'icon-image': 'marker-15' }}
          >
            <Feature coordinates={this.state.selectedLocationCoordinates} />
          </Layer>
        )}
      </Map>
    );
  }
}

export default withRouter(CrossingMap);
