import React, { Component } from 'react';
import CrossingStatusHistory from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistory';
import { ContainerQuery } from 'react-container-query';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';

const containerQuery = {
  'CrossingDetails__container--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

class CrossingStatusHistoryPage extends Component {
  render() {
    return (
      <ContainerQuery query={containerQuery}>
        {params => (
          <div className="CrossingDetailPage">
            <CrossingStatusHistory
              showNames
              maxRows={500}
            />
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default CrossingStatusHistoryPage;
