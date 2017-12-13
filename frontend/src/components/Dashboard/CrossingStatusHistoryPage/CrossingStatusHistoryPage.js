import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingStaticMap from 'components/Map/CrossingStaticMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import CrossingStatusHistory from 'components/Dashboard/CrossingDetailPage/CrossingStatusHistory';
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
            <CrossingStatusHistory history={history}/>
          </div>
        )}
      </ContainerQuery>
    );
  }

}

const CrossingHistoryQuery = gql`
query crossingHistory {
  allStatusUpdates(
    orderBy: CREATED_AT_DESC
  ) {
    nodes {
      userByCreatorId {
        id
        lastName
        firstName
      }
      statusByStatusId {
        id
        name
      }
      statusReasonByStatusReasonId {
        name
      }
      statusDurationByStatusDurationId {
         name
       }
      createdAt
      notes
      crossingId
      crossingByCrossingId {
        name
        humanAddress
      }
    }
  }
}
`;

export default graphql(CrossingHistoryQuery)(CrossingStatusHistoryPage);
