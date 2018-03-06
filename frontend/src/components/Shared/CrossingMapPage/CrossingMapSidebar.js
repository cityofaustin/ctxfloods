import React, { Component } from 'react';
import SelectedCrossingContainer from 'components/Shared/CrossingMapPage/SelectedCrossingContainer';
import CrossingMapSearchBar from 'components/Shared/CrossingMapPage/CrossingMapSearchBar';
import CrossingSidebarNearbyCrossingItem from 'components/Shared/CrossingMapPage/CrossingSidebarNearbyCrossingItem';
import InfiniteCrossingStatusHistoryPaginationContainer from 'components/Dashboard/CrossingStatusHistory/InfiniteCrossingStatusHistoryPaginationContainer';
import 'components/Shared/CrossingMapPage/CrossingMapSidebar.css';
import FontAwesome from 'react-fontawesome';
import classnames from 'classnames';

const FilterCheckbox = ({ defaultChecked, onClick, title }) => (
  <label className="CrossingMapPage_sidebar-filter">
    <input
      className="CrossingMapPage_sidebar-filter-checkbox"
      type="checkbox"
      defaultChecked={defaultChecked}
      onClick={onClick}
    />
    <div>{title}</div>
  </label>
);

class CrossingMapSidebar extends Component {
  constructor(props) {
    super(props);

    this.state = {
      visible: true,
      showFilters: false,
      searchFocused: false,
      showNearby: true,
      showHistory: false,
    };
  }

  componentWillReceiveProps(nextProps) {
    // If we're unselecting a crossing, stop trying to show the history
    if (this.props.selectedCrossingId && !nextProps.selectedCrossingId) {
      this.setState({
        showNearby: true,
        showHistory: false,
      });
    }
  }

  toggleSidebar = () => {
    this.setState({ visible: !this.state.visible });
  };

  toggleFilters = () => {
    this.setState({ showFilters: !this.state.showFilters });
  };

  toggleSearchFocus = focused => {
    this.setState({ searchFocused: focused });
  };

  toggleNearbyHistory = tab => {
    if (tab === 'nearby') {
      this.setState({
        showNearby: true,
        showHistory: false,
      });
    }

    if (tab === 'history') {
      this.setState({
        showNearby: false,
        showHistory: true,
      });
    }
  };

  render() {
    const { visible, searchFocused, showNearby, showHistory } = this.state;
    const {
      toggleShowOpen,
      toggleShowClosed,
      toggleShowCaution,
      toggleShowLongterm,
      showOpen,
      showClosed,
      showCaution,
      showLongterm,
      searchQuery,
      searchQueryUpdated,
      selectedCrossingId,
      selectCrossing,
      currentUser,
      visibleCrossings,
      allCommunities,
      selectedCrossingName,
      center,
      setSelectedLocationCoordinates,
      setSelectedCommunity,
    } = this.props;

    return (
      <div className="CrossingMapSidebar__overlay-container">
        {visible && (
          <div className="CrossingMapSidebar__content">
            <CrossingMapSearchBar
              selectedCrossingId={selectedCrossingId}
              selectCrossing={selectCrossing}
              searchQuery={searchQuery}
              searchQueryUpdated={searchQueryUpdated}
              selectedCrossingName={selectedCrossingName}
              center={center}
              setSelectedLocationCoordinates={setSelectedLocationCoordinates}
              toggleSearchFocus={this.toggleSearchFocus}
              communities={allCommunities}
              communityId={currentUser && currentUser.communityId}
              setSelectedCommunity={setSelectedCommunity}
            />

            {!searchFocused && (
              <div>
                {selectedCrossingId && (
                  <SelectedCrossingContainer
                    crossingId={selectedCrossingId}
                    currentUser={currentUser}
                    selectCrossing={selectCrossing}
                  />
                )}
                {!selectedCrossingId && (
                  <div>
                    <div className="CrossingMapPage_sidebar-filter-sort-toggle-container">
                      <div
                        className={classnames(
                          'CrossingMapPage_sidebar-filter-toggle',
                          {
                            selected: this.state.showFilters,
                          },
                        )}
                        onClick={this.toggleFilters}
                      >
                        <div className="CrossingMapPage_sidebar-filter-toggle-text">
                          {this.state.showFilters ? (
                            <span className="CrossingMapPage_sidebar-filter-toggle-icon"><FontAwesome name="minus" ariaLabel="Hide" /></span>
                          ) : (
                            <span className="CrossingMapPage_sidebar-filter-toggle-icon"><FontAwesome name="plus" ariaLabel="Show" /></span>
                          )}{' '}
                          Filter
                        </div>
                      </div>
                      <div className="CrossingMapPage_sidebar-sort-toggle">
                        Last Updated
                        <span className="CrossingMapPage_sidebar-sort-toggle-icon"><FontAwesome name="chevron-down" ariaLabel="Sort" /></span>
                      </div>
                    </div>
                    {this.state.showFilters && (
                      <div className="CrossingMapPage_sidebar-filter-container">
                        <FilterCheckbox
                          title="Open"
                          defaultChecked={showOpen}
                          onClick={toggleShowOpen}
                        />
                        <FilterCheckbox
                          title="Closed"
                          defaultChecked={showClosed}
                          onClick={toggleShowClosed}
                        />
                        <FilterCheckbox
                          title="Caution"
                          defaultChecked={showCaution}
                          onClick={toggleShowCaution}
                        />
                        <FilterCheckbox
                          title="Long Term Closure"
                          defaultChecked={showLongterm}
                          onClick={toggleShowLongterm}
                        />
                      </div>
                    )}
                  </div>
                )}
                {selectedCrossingId && (
                  <div className="CrossingMapPage_sidebar-nearby-history-toggle">
                    <div
                      className={classnames(
                        'CrossingMapPage_sidebar-nearby-tab',
                        {
                          selected: this.state.showNearby,
                        },
                      )}
                      onClick={() => this.toggleNearbyHistory('nearby')}
                    >
                      <FontAwesome name="map-marker" /> Nearby
                    </div>
                    <div
                      className={classnames(
                        'CrossingMapPage_sidebar-history-tab',
                        {
                          selected: this.state.showHistory,
                        },
                      )}
                      onClick={() => this.toggleNearbyHistory('history')}
                    >
                      <FontAwesome name="history" /> History
                    </div>
                  </div>
                )}
                {showNearby && (
                  <div className="CrossingMapPage_sidebar-nearbycrossings">
                    {visibleCrossings.map(c => (
                      <CrossingSidebarNearbyCrossingItem
                        key={c.id}
                        latestStatus={c.latestStatus}
                        statusId={c.statusId}
                        crossingId={c.id}
                        crossingName={c.crossingName}
                        communityIds={c.communityIds}
                        allCommunities={allCommunities}
                        selectCrossing={selectCrossing}
                      />
                    ))}
                  </div>
                )}
                {showHistory && (
                  <div className="CrossingMapPage_sidebar-crossing-status-history">
                    <InfiniteCrossingStatusHistoryPaginationContainer
                      crossingId={selectedCrossingId}
                      showNames={false}
                    />
                  </div>
                )}
              </div>
            )}
          </div>
        )}
        <div
          className="CrossingMapPage_sidebar-toggle"
          onClick={this.toggleSidebar}
        >
          {visible ? (
            <FontAwesome
              name="angle-left"
              size="2x"
              onClick={this.toggleSidebar}
            />
          ) : (
            <FontAwesome
              name="angle-right"
              size="2x"
              onClick={this.toggleSidebar}
            />
          )}
        </div>
      </div>
    );
  }
}

export default CrossingMapSidebar;
