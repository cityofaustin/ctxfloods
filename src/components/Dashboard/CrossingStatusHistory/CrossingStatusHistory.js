import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classnames from 'classnames';
import { ContainerQuery } from 'react-container-query';
import FontAwesome from 'react-fontawesome';
import moment from 'moment';

import { dateToString } from 'components/../services/dateHelpers';
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

    let communityId = null;
    if (props.currentUser) {
      if (auth.roleAuthorized(['floods_super_admin'])) {
        communityId = ALL_COMMUNITIES_INDEX;
      } else {
        communityId = props.currentUser.communityId;
      }
    }

    this.state = {
      showFilter: false,
      communityId,
      dateLowerBound: null,
      dateUpperBound: null,
      inclusiveEndDate: false,
      receivedAllStatusUpdates: false // Bool, Have all statusUpdates for a filter been fetched from db?
    }
  }

  setReceivedAlStatuslUpdates = () => {
    this.setState({receivedAllStatusUpdates: true});
  }

  toggleFilterDropdown = () => {
    this.setState((prevState) => ({
      showFilter: !prevState.showFilter
    }))
  }

  applyFilter = (values) => {
    this.setState({
      ...values,
      showFilter: false,
      receivedAllStatusUpdates: false,
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
      communityId,
      dateLowerBound,
      dateUpperBound,
      inclusiveEndDate,
      receivedAllStatusUpdates,
    } = this.state;
    const { showNames, crossingId, maxRows } = this.props;
    const canSelectCommunity = auth.roleAuthorized(['floods_super_admin']);

    // set communityId query variable to "null" if user selected "All Communities" in filter
    const queryCommunityId = (communityId === ALL_COMMUNITIES_INDEX) ? null : communityId;

    let queryDateUpperBound;
    if (dateUpperBound) {
      if (inclusiveEndDate) {
        queryDateUpperBound = dateToString(moment(dateUpperBound).add(1,'d'));
      } else {
        queryDateUpperBound = dateUpperBound;
      }
    } else {
      queryDateUpperBound = null;
    }

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
                communityId={queryCommunityId}
                dateLowerBound={dateLowerBound}
                dateUpperBound={queryDateUpperBound}
              />
            </div>
            <div className={classnames('CrossingStatusHistory__section-header-filter', {
              'invisible': !this.state.showFilter,
            })}>
              <div className="CrossingListSpacer" />
              <CrossingStatusHistoryFilter
                canSelectCommunity={canSelectCommunity}
                crossingId={crossingId}
                communityId={communityId}
                dateLowerBound={dateLowerBound}
                dateUpperBound={dateUpperBound}
                inclusiveEndDate={inclusiveEndDate}
                applyFilter={this.applyFilter}
              />
              <div className="CrossingListSpacer" />
            </div>
            <InfiniteCrossingStatusHistoryPaginationContainer
              communityId={queryCommunityId}
              crossingId={crossingId}
              dateLowerBound={dateLowerBound}
              dateUpperBound={queryDateUpperBound}
              showNames={showNames}
              maxRows={maxRows}
              receivedAllStatusUpdates={receivedAllStatusUpdates}
              setReceivedAllUpdates={this.setReceivedAllUpdates}
            />
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default CrossingStatusHistory;
