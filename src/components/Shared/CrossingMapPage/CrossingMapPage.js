import React, { Component } from 'react';
import { ContainerQuery } from 'react-container-query';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import Fullscreen from 'react-full-screen';
import FontAwesome from 'react-fontawesome';

import CrossingMap from 'components/Shared/Map/CrossingMap';
import CrossingMapSidebar from 'components/Shared/CrossingMapPage/CrossingMapSidebar';
import CrossingMapSearchBar from 'components/Shared/CrossingMapPage/CrossingMapSearchBar';
import FilterCheckbox from 'components/Shared/FilterCheckbox';

import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import allCrossings from 'components/Shared/Map/queries/allCrossingsQuery';
import allCamerasQuery from 'components/Shared/Map/queries/allCamerasQuery';
import communityFragment from 'components/Shared/Map/queries/communityFragment';
import * as selectors from 'components/Shared/CrossingMapPage/selectors';

const containerQuery = {
  fullsize: {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

class CrossingMapPage extends Component {
  constructor(props) {
    console.log("CrossingMapPage constructing")
    super(props);

    // If we have a current user, we're on the dashboard, we should get their viewport
    const viewportgeojson = (this.props.currentUser && this.props.currentUser.communityByCommunityId.viewportgeojson) ||
      `{"type":"Polygon","coordinates":[[[-98.086914,30.148464],[-98.086914,30.433285],[-97.615974,30.433285],[-97.615974,30.148464],[-98.086914,30.148464]]]}`;

    const viewportAndCenter = this.getViewportAndCenter(viewportgeojson);

    this.state = {
      selectedCrossingId: null,
      selectedCameraId: null,
      selectedCrossingStatus: null,
      fullscreen: false,
      searchQuery: '',
      formattedSearchQuery: '%%',
      showOpen: this.props.onDash,
      showClosed: true,
      showCaution: true,
      showLongterm: true,
      selectedLocationCoordinates: null,
      selectedCommunity: null,
      viewport: viewportAndCenter.viewport,
      center: viewportAndCenter.center,
      mapLoaded: false,
      searchFocused: false,
    };
  }

  componentDidUpdate(prevProps) {
    console.log("Hey component updated")
    const didLoad = selectors.getIsLoading(this.props) && selectors.getIsLoading(prevProps);
    const didSelectedCommunityChange =
      this.props.match.params.selectedCommunityId !==
      prevProps.match.params.selectedCommunityId;

    const didSelectedCrossingChange =
      this.props.match.params.selectedCrossingId !==
      prevProps.match.params.selectedCrossingId;

    if (didSelectedCrossingChange) {
      console.log("And the selectedCrossingChanged!")
    }

    const didSelectedCameraChange =
      this.props.match.params.selectedCameraId !==
      prevProps.match.params.selectedCameraId;

    if (didSelectedCrossingChange && this.state.mapLoaded) {
      this.selectCrossing(
        this.props.match.params.selectedCrossingId &&
          Number(this.props.match.params.selectedCrossingId),
      );
    }

    if (didSelectedCameraChange && this.state.mapLoaded) {
      this.selectCamera(
        this.props.match.params.selectedCameraId &&
        Number(this.props.match.params.selectedCameraId)
      )
    }

    if (didLoad || didSelectedCommunityChange) {
      this.setSelectedCommunity();
    }
  }

  setSelectedCommunity = () => {
    const selectedCommunityId = this.props.match.params.selectedCommunityId;
    if (selectedCommunityId) {
      const selectedCommunity = this.props.allCommunities.allCommunities.nodes.find(
        community => community.id === Number(selectedCommunityId),
      );

      this.setState({ selectedCommunity });
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
  };

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

  selectCrossing = (crossingId, crossingStatus) => {
    this.setState(
      {
        selectedCrossingId: crossingId,
        selectedCrossingStatus: crossingStatus,
      },
      () => {
        this.triggerMapResize();
      },
    );
  };

  selectCamera = (cameraId) => {
    this.setState(
      {
        selectedCameraId: cameraId
      },
      () => {
        this.triggerMapResize()
      }
    )
  }

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

  setSelectedLocationCoordinates = coordinates => {
    this.setState({ selectedLocationCoordinates: coordinates });
  };

  setMapLoaded = () => {
    this.setState({ mapLoaded: true });
    if (this.props.match.params.selectedCrossingId)
      this.selectCrossing(Number(this.props.match.params.selectedCrossingId));
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
      selectedCrossingId,
      selectedCrossingStatus,
      searchQuery,
      formattedSearchQuery,
      selectedLocationCoordinates,
      selectedCommunity,
      selectedCameraId
    } = this.state;
    const { currentUser, onDash } = this.props;

    const isLoading = selectors.getIsLoading(this.props);

    if (selectors.isLoadedWithErrors(this.props)) {
      // TODO: add error logging
      return <div>Error Loading</div>;
    }

    const allCommunities = selectors.getAllCommunities(this.props);
    const openCrossings = selectors.getOpenCrossings(this.props);
    const closedCrossings = selectors.getClosedCrossings(this.props);
    const cautionCrossings = selectors.getCautionCrossings(this.props);
    const longtermCrossings = selectors.getLongtermCrossings(this.props);
    const allCameras = selectors.getAllCameras(this.props);
    const selectedCrossing = selectors.getSelectedCrossing(this.props);

    console.log("open Crossings", this.props.openCrossings)
    console.log("allCameras", this.props.allCameras)

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
                      setSelectedLocationCoordinates={
                        this.setSelectedLocationCoordinates
                      }
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
                      setSelectedLocationCoordinates={
                        this.setSelectedLocationCoordinates
                      }
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
                    selectedLocationCoordinates={selectedLocationCoordinates}
                    selectedCrossingId={selectedCrossingId}
                    selectedCrossing={selectedCrossing}
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
                    selectedCommunityId={
                      selectedCommunity && selectedCommunity.id
                    }
                    registerMapResizeCallback={this.registerMapResizeCallback}
                    mobile={!params.fullsize}
                    setMapLoaded={this.setMapLoaded}
                    autoGeoLocate={
                      !this.props.match.params.selectedCommunityId &&
                      !this.props.match.params.selectedCrossingId &&
                      !this.props.match.params.selectedCameraId
                    }
                    allCameras={allCameras}
                    selectedCameraId={selectedCameraId}
                    selectedCamera={null}
                    showCameras={true}
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

const allCommunities = gql`
  {
    allCommunities {
      nodes {
        ...communityInfo
      }
    }
  }
  ${communityFragment}
`;

export default compose(
  graphql(allCrossings, {
    name: 'openCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: true,
        showClosed: false,
        showCaution: false,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'closedCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: true,
        showCaution: false,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'cautionCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: false,
        showCaution: true,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'longtermCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: false,
        showCaution: false,
        showLongterm: true,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCommunities, {
    name: 'allCommunities',
  }),
  graphql(allCamerasQuery, {
    name: 'allCameras'
  })
)(CrossingMapPage);
