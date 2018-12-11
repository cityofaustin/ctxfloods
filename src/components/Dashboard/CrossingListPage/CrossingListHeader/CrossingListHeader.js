import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';
import classNames from 'classnames';

import CrossingListFilter from 'components/Dashboard/CrossingListPage/CrossingListHeader/CrossingListFilter';

import CaretIcon from 'components/Shared/Icons/CaretIcon';
import PlusMinusIcon from 'components/Shared/Icons/PlusMinusIcon';
import 'components/Dashboard/CrossingListPage/CrossingListHeader/CrossingListHeader.css';

export default class CrossingListHeader extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showCrossingListFilter: false,
    };
  }

  toggleFilterDropdown = () => {
    this.setState({
      showCrossingListFilter: !this.state.showCrossingListFilter,
    });
  };

  render() {
    const {
      toggleShowOpen,
      toggleShowClosed,
      toggleShowCaution,
      toggleShowLongterm,
      toggleSortByUpdated,
      showOpen,
      showClosed,
      showCaution,
      showLongterm,
      sortByUpdatedAsc,
      searchQuery,
      searchQueryUpdated,
      formattedSearchQuery,
      currentUser,
    } = this.props;

    return (
      <div className="CrossingListHeaderContainer">
        <div className="CrossingListHeader">
          <div className="CrossingListSearch">
            <input
              type="text"
              className="CrossingListSearchInput"
              placeholder="Search your crossings"
              value={searchQuery}
              onChange={searchQueryUpdated}
            />
            <div className="CrossingListSearchButton">
              <FontAwesome name="search" ariaLabel="Search" />
            </div>
          </div>
          <div
            className={classNames('CrossingListFilterContainer', {
              'CrossingListFilterContainer--enabled': this.state
                .showCrossingListFilter,
              'CrossingListFilterContainer--disabled': !this.state
                .showCrossingListFilter,
            })}
          >
            <CrossingListFilter
              formattedSearchQuery={formattedSearchQuery}
              currentUser={currentUser}
              showOpen={showOpen}
              toggleShowOpen={toggleShowOpen}
              showClosed={showClosed}
              toggleShowClosed={toggleShowClosed}
              showCaution={showCaution}
              toggleShowCaution={toggleShowCaution}
              showLongterm={showLongterm}
              toggleShowLongterm={toggleShowLongterm}
            />
          </div>

          <div className="CrossingListSpacer" />
          <div className="CrossingListToggleMenu">
            <div
              className="CrossingListFilterToggle"
              onClick={this.toggleFilterDropdown}
            >
              Filter
              <PlusMinusIcon isEnabled={this.state.showCrossingListFilter} />
            </div>
            <div
              className="CrossingListSortToggle"
              onClick={toggleSortByUpdated}
            >
              Last Updated
              <CaretIcon isEnabled={sortByUpdatedAsc} />
            </div>
          </div>
        </div>
      </div>
    );
  }
}
