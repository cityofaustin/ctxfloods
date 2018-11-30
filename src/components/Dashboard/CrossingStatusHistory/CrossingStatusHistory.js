import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classnames from 'classnames';
import { ContainerQuery } from 'react-container-query';
import FontAwesome from 'react-fontawesome';

import { ALL_COMMUNITIES_INDEX } from 'constants/AppConstants';
import auth from 'services/gqlAuth';
import PlusMinusIcon from 'components/Shared/Icons/PlusMinusIcon';
import CrossingStatusHistoryFilter from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistoryFilter';
import InfiniteCrossingStatusHistoryPaginationContainer from 'components/Dashboard/CrossingStatusHistory/InfiniteCrossingStatusHistoryPaginationContainer';
import CrossingStatusHistorySpreadsheetLink from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistorySpreadsheetLink';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';

import 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistory.css';

const containerQuery = {
  'CrossingStatusHistory--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

class CrossingStatusHistory extends Component {

  constructor(props) {
    super(props);

    let selectedCommunityId = null;
    if (props.currentUser) {
      if (auth.roleAuthorized(['floods_super_admin'])) {
        selectedCommunityId = ALL_COMMUNITIES_INDEX;
      } else {
        selectedCommunityId = props.currentUser.communityId;
      }
    }

    this.state = {
      showFilter: false,
      selectedCommunityId,
      dateLowerBound: null,
      dateUpperBound: null,
      inclusiveEndDate: false,
    }
  }

  toggleFilterDropdown = () => {
    this.setState((prevState) => ({
      showFilter: !prevState.showFilter
    }))
  }

  applyFilter = (values) => {
    this.setState({
      ...values,
      showFilter: false
    });
  }

  static propTypes = {
    showNames: PropTypes.bool,
    crossingId: PropTypes.number,
  };

  static defaultProps = {
    showNames: false,
  };

  render() {
    const {
      selectedCommunityId,
      dateLowerBound,
      dateUpperBound,
      inclusiveEndDate,
    } = this.state;
    const { showNames, crossingId, maxRows } = this.props;
    const canSelectCommunity = auth.roleAuthorized(['floods_super_admin']);

    return (
      <ContainerQuery query={containerQuery}>
        {params => (
          <div className={classnames(params, 'CrossingStatusHistory')}>
            <div className="CrossingStatusHistory__section-header">
              <div className="CrossingStatusHistory__section-header--title">
                <div className="CrossingStatusHistory__section-header--history-icon">
                  <FontAwesome
                    size="lg"
                    name="history"
                    ariaLabel="Crossing History"
                  />
                </div>
                Crossing History
              </div>
              <div
                className="CrossingStatusHistoryFilterToggle"
                onClick={this.toggleFilterDropdown}
              >
                Filter
                <PlusMinusIcon isEnabled={this.state.showFilter} />
              </div>
              <CrossingStatusHistorySpreadsheetLink
                crossingId={crossingId}
              />
            </div>
            <div className={classnames('CrossingStatusHistory__section-header-filter', {
              'invisible': !this.state.showFilter,
            })}>
              <div className="CrossingListSpacer" />
              <CrossingStatusHistoryFilter
                canSelectCommunity={canSelectCommunity}
                selectedCommunityId={selectedCommunityId}
                dateLowerBound={dateLowerBound}
                dateUpperBound={dateUpperBound}
                inclusiveEndDate={inclusiveEndDate}
                applyFilter={this.applyFilter}
              />
              <div className="CrossingListSpacer" />
            </div>
            <InfiniteCrossingStatusHistoryPaginationContainer
              crossingId={crossingId}
              showNames={showNames}
              maxRows={maxRows}
            />
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default CrossingStatusHistory;
