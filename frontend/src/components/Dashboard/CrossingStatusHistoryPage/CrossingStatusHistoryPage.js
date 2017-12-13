import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingStaticMap from 'components/Map/CrossingStaticMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import CrossingStatusHistory from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistory';
import statusHistoryQuery from 'components/Dashboard/CrossingListPage/queries/statusHistoryQuery';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';

const containerQuery = {
  'CrossingDetails__container--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  }
};

class CrossingStatusHistoryPage extends Component {
  render() {
    const isLoading = (
      !this.props.data ||
       this.props.data.loading
    );

    if ( isLoading ) { return (<div>Loading</div>) };

    const history = this.props.data.allStatusUpdates.nodes;

    return (
      <ContainerQuery query={containerQuery}>
        {(params) => (
          <div className="CrossingDetailPage">
            <CrossingStatusHistory history={history} showNames/>
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default graphql(statusHistoryQuery, {
  options: (ownProps) => ({
    variables: {}
  })
})(CrossingStatusHistoryPage);
