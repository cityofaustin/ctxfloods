import React, { Component } from 'react';
import { ContainerQuery } from 'react-container-query';
import Fullscreen from 'react-full-screen';
import FontAwesome from 'react-fontawesome';
import _ from 'lodash';

import CrossingMap from 'components/Shared/Map/CrossingMap';
import CrossingMapSidebar from 'components/Shared/CrossingMapPage/CrossingMapSidebar';
import CrossingMapSearchBar from 'components/Shared/CrossingMapPage/CrossingMapSearchBar';
import FilterCheckbox from 'components/Shared/FilterCheckbox';

import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import * as selectors from 'components/Shared/CrossingMapPage/selectors';

const containerQuery = {
  fullsize: {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

export default class CrossingMapPage extends Component {
  constructor(props) {
    super(props);

    // If we have a current user, we're on the dashboard, we should get their viewport
    const viewportgeojson = (this.props.currentUser && this.props.currentUser.communityByCommunityId.viewportgeojson) ||
      `{"type":"Polygon","coordinates":[[[-98.086914,30.148464],[-98.086914,30.433285],[-97.615974,30.433285],[-97.615974,30.148464],[-98.086914,30.148464]]]}`;

    const viewportAndCenter = this.getViewportAndCenter(viewportgeojson);

    this.state = {
      fullscreen: false,
      searchQuery: '',
      formattedSearchQuery: '%%',
      showOpen: props.onDash,
      showClosed: true,
      showCaution: true,
      showLongterm: true,
      selectedFeature: null,
      viewport: viewportAndCenter.viewport,
      center: viewportAndCenter.center,
      mapLoaded: false,
      searchFocused: false,
    };
  }

  componentDidUpdate(prevProps) {
    if (this.state.mapLoaded && this.props.isDataLoaded) {
      const selectedCrossingId = selectors.getSelectedCrossingId(this.props);
      const selectedCameraId = selectors.getSelectedCameraId(this.props);

      // Clear out selectedFeature state when props change
      if (
        _.isEmpty(this.props.match.params) && !_.isEmpty(prevProps.match.params)
      ) {
        this.setState({selectedFeature: null});
        // Handle Crossing Change
      } else if (selectedCrossingId && (
        selectedCrossingId != prevProps.match.params.selectedCrossingId
      )) {
        const selectedCrossing = selectors.getSelectedCrossing(this.props);
        this.setState({
          selectedFeature: {
            type: "Crossing",
            data: selectedCrossing
          },
          center: {
            lng: selectedCrossing.coordinates[0],
            lat: selectedCrossing.coordinates[1]
          }
        })
        // Handle Camera Change
      } else if (selectedCameraId && (
        selectedCameraId !== prevProps.match.params.selectedCameraId
      )) {
        const selectedCamera = selectors.getSelectedCamera(this.props);
        this.setState({
          selectedFeature: {
            type: "Camera",
            data: selectedCamera
          },
          center: {
            lng: selectedCamera.coordinates[0],
            lat: selectedCamera.coordinates[1]
          }
        })
      }
    // Handle Community Change
    } else if (
      (selectors.getSelectedCommunityId(this.props) != prevProps.match.params.selectedCommunityId)
    ) {
      const selectedCommunity = selectors.getSelectedCommunity(this.props);
      if (selectedCommunity && selectedCommunity.viewportgeojson) {
        const viewportAndCenter = this.getViewportAndCenter(
          selectedCommunity.viewportgeojson,
        );
        this.setState({
          viewport: viewportAndCenter.viewport,
          center: viewportAndCenter.center,
        });
      }
    }
  }

  registerMapResizeCallback = cb => {
    this.mapResizeCallback = cb;
  };

  triggerMapResize = () => {
    if (this.mapResizeCallback) {
      this.mapResizeCallback();
    }
  };

  getViewportAndCenter = viewportgeojson => {
    const envelope = JSON.parse(viewportgeojson);
    let viewport, center;

    if (envelope.type === 'Point') {
      viewport = [
        [
          envelope.coordinates[0] - 0.1,
          envelope.coordinates[1] - 0.1
        ],
        [
          envelope.coordinates[0] + 0.1,
          envelope.coordinates[1] + 0.1
        ]
      ];

      center = {
        lng: envelope.coordinates[0],
        lat: envelope.coordinates[1]
      }
    } else {
      viewport = [
        [
          Math.min(...envelope.coordinates[0].map(arr => arr[0])) - 0.1,
          Math.min(...envelope.coordinates[0].map(arr => arr[1])) - 0.1,
        ],
        [
          Math.max(...envelope.coordinates[0].map(arr => arr[0])) + 0.1,
          Math.max(...envelope.coordinates[0].map(arr => arr[1])) + 0.1,
        ],
      ];

      center = {
        lng: (viewport[0][0] + viewport[1][0]) / 2,
        lat: (viewport[0][1] + viewport[1][1]) / 2,
      };
    }

    return {
      viewport: viewport,
      center: center,
    };
  };

  toggleFullscreen = () => {
    this.setState({ fullscreen: !this.state.fullscreen });
  };

  toggleShowOpen = () => {
    this.setState({ showOpen: !this.state.showOpen });
  };
  toggleShowClosed = () => {
    this.setState({ showClosed: !this.state.showClosed });
  };
  toggleShowCaution = () => {
    this.setState({ showCaution: !this.state.showCaution });
  };
  toggleShowLongterm = () => {
    this.setState({ showLongterm: !this.state.showLongterm });
  };

  setCenter = center => {
    this.setState({ center: center });
  };

  setSelectedFeature = feature => {
    const stateObject = {
      selectedFeature: feature
    }
    if (feature) {
      stateObject.center = {
        lng: feature.data.coordinates[0],
        lat: feature.data.coordinates[1]
      }
    }
    this.setState(stateObject);
  }

  setMapLoaded = () => {
    // Initialize selectedFeature if data is passed as params
    const selectedCrossing = selectors.getSelectedCrossing(this.props);
    const selectedCamera = selectors.getSelectedCamera(this.props);

    if (selectedCrossing) {
      this.setState({
        selectedFeature: {
          type: "Crossing",
          data: selectedCrossing
        },
        center: {
          lng: selectedCrossing.coordinates[0],
          lat: selectedCrossing.coordinates[1]
        },
        mapLoaded: true
      });
    } else if (selectedCamera) {
      this.setState({
        selectedFeature: {
          type: "Camera",
          data: selectedCamera
        },
        center: {
          lng: selectedCamera.coordinates[0],
          lat: selectedCamera.coordinates[1]
        },
        mapLoaded: true
      })
    } else {
      this.setState({
        mapLoaded: true
      });
    }
  };

  toggleSearchFocus = focused => {
    this.setState({ searchFocused: focused }, () => {
      this.triggerMapResize();
    });
  };

  render() {
    const {
      viewport,
      center,
      searchQuery,
      formattedSearchQuery,
      selectedFeature,
    } = this.state;
    const {
      currentUser,
      onDash,
      setSelectedFeature,
     } = this.props;

    const allCommunities = selectors.getAllCommunities(this.props);
    const openCrossings = selectors.getOpenCrossings(this.props);
    const closedCrossings = selectors.getClosedCrossings(this.props);
    const cautionCrossings = selectors.getCautionCrossings(this.props);
    const longtermCrossings = selectors.getLongtermCrossings(this.props);
    const allCameras = selectors.getAllCameras(this.props);
    const isDataLoaded = this.props.isDataLoaded;

    const selectedCommunityId = selectors.getSelectedCommunityId(this.props);
    const selectedCrossingId = selectors.getSelectedCrossingId(this.props);
    const selectedCameraId = selectors.getSelectedCameraId(this.props);

    return (
      <ContainerQuery query={containerQuery}>
        {params => (
          <div className="CrossingMapPage__page-container">
            <Fullscreen
              enabled={this.state.fullscreen}
              onChange={fullscreen => this.setState({ fullscreen })}
            >
              <div className="CrossingMapPage">
                {!params.fullsize && (
                  <React.Fragment>
                    <CrossingMapSearchBar
                      selectedCrossingId={selectedCrossingId}
                      searchQuery={searchQuery}
                      searchQueryUpdated={this.searchQueryUpdated}
                      toggleSearchFocus={this.toggleSearchFocus}
                      communities={allCommunities}
                      center={center}
                      setSelectedFeature={this.setSelectedFeature}
                      mobile={true}
                      onDash={onDash}
                    />
                    {!this.state.searchFocused && (
                      <div className="CrossingMapPage__mobile-status-filters">
                        <FilterCheckbox
                          isChecked={this.state.showOpen}
                          onClick={this.toggleShowOpen}
                        >
                          Open
                        </FilterCheckbox>
                        <FilterCheckbox
                          isChecked={this.state.showClosed}
                          onClick={this.toggleShowClosed}
                        >
                          Closed
                        </FilterCheckbox>
                        <FilterCheckbox
                          isChecked={this.state.showCaution}
                          onClick={this.toggleShowCaution}
                        >
                          Caution
                        </FilterCheckbox>
                        <FilterCheckbox
                          isChecked={this.state.showLongterm}
                          onClick={this.toggleShowLongterm}
                        >
                          Long-Term
                        </FilterCheckbox>
                      </div>
                    )}
                  </React.Fragment>
                )}
                {params.fullsize && (
                  <React.Fragment>
                    <div className="CrossingMapPage__fullscreen-toggle-container">
                      <FontAwesome
                        name="arrows-alt"
                        size="2x"
                        onClick={this.toggleFullscreen}
                        className="CrossingMapPage__fullscreen-toggle"
                      />
                    </div>
                    <CrossingMapSidebar
                      selectedCrossingId={selectedCrossingId}
                      currentUser={currentUser}
                      searchQuery={searchQuery}
                      searchQueryUpdated={this.searchQueryUpdated}
                      showOpen={this.state.showOpen}
                      toggleShowOpen={this.toggleShowOpen}
                      showClosed={this.state.showClosed}
                      toggleShowClosed={this.toggleShowClosed}
                      showCaution={this.state.showCaution}
                      toggleShowCaution={this.toggleShowCaution}
                      showLongterm={this.state.showLongterm}
                      toggleShowLongterm={this.toggleShowLongterm}
                      allCommunities={allCommunities}
                      openCrossings={openCrossings}
                      closedCrossings={closedCrossings}
                      longtermCrossings={longtermCrossings}
                      cautionCrossings={cautionCrossings}
                      center={center}
                      setSelectedFeature={this.setSelectedFeature}
                      triggerMapResize={this.triggerMapResize}
                      onDash={onDash}
                    />
                  </React.Fragment>
                )}
                <div className="CrossingMapPage__map-container">
                  <CrossingMap
                    mapHeight="100%"
                    mapWidth="100%"
                    viewport={viewport}
                    setCenter={this.setCenter}
                    currentUser={currentUser}
                    searchQuery={formattedSearchQuery}
                    showOpen={this.state.showOpen}
                    showClosed={this.state.showClosed}
                    showCaution={this.state.showCaution}
                    showLongterm={this.state.showLongterm}
                    openCrossings={openCrossings}
                    closedCrossings={closedCrossings}
                    longtermCrossings={longtermCrossings}
                    cautionCrossings={cautionCrossings}
                    selectedCommunityId={selectedCommunityId}
                    registerMapResizeCallback={this.registerMapResizeCallback}
                    mobile={!params.fullsize}
                    setMapLoaded={this.setMapLoaded}
                    autoGeoLocate={
                      !selectedCommunityId &&
                      !selectedCrossingId &&
                      !selectedCameraId
                    }
                    allCameras={allCameras}
                    selectedFeature={selectedFeature}
                    center={center}
                    showCameras={true}
                    isDataLoaded={isDataLoaded}
                    setSelectedFeature={setSelectedFeature}
                    onDash={onDash}
                  />
                </div>
              </div>
            </Fullscreen>
          </div>
        )}
      </ContainerQuery>
    );
  }
}
