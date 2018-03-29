import React, { Component } from 'react';
import classnames from 'classnames';
import { ContainerQuery } from 'react-container-query';
import FontAwesome from 'react-fontawesome';

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
  render() {
    const { showNames, crossingId } = this.props;

    return (
      <ContainerQuery query={containerQuery}>
        {params => (
          <div className={classnames(params, 'CrossingStatusHistory')}>
            <div className="CrossingStatusHistory_header-background">
              <div className="CrossingStatusHistory__section-header">
                <div className="CrossingStatusHistory__section-header--title">
                  <div className="CrossingStatusHistory__section-header--history-icon">
                    <FontAwesome size="lg" name="history" ariaLabel="Crossing History" />
                  </div>
                  Crossing History
                </div>
                <CrossingStatusHistorySpreadsheetLink crossingId={crossingId} />
              </div>
            </div>
            <div className="CrossingStatusHistory__list-wrapper">
              <InfiniteCrossingStatusHistoryPaginationContainer
                crossingId={crossingId}
                showNames={showNames}
              />
            </div>
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default CrossingStatusHistory;
