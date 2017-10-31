import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import CrossingStatusHistory from 'components/Dashboard/CrossingDetailPage/CrossingStatusHistory';


class CrossingDetailPage extends Component {
  render() {
    const isLoading = (
      !this.props.CrossingByIdQuery ||
       this.props.CrossingByIdQuery.loading ||
      !this.props.CrossingHistoryQuery ||
       this.props.CrossingHistoryQuery.loading
    );

    if ( isLoading ) { return (<div>Loading</div>) };

    const crossing = this.props.CrossingByIdQuery.crossingById;
    const communities = crossing.communityCrossingsByCrossingId.nodes.map(n => n.communityByCommunityId);
    const history = this.props.CrossingHistoryQuery.allStatusUpdates.nodes;

    return (
      <div>
        <CrossingDetails crossing={crossing} communities={communities}/>
        <CrossingStatusHistory history={history}/>
      </div>
    );
  }

}

const CrossingByIdQuery = gql`
  query crossingById($crossingId:Int!) {
    crossingById(id:$crossingId) {
      id
      name
      humanCoordinates
      humanAddress
      description
      communityCrossingsByCrossingId {
        nodes {
          communityByCommunityId {
            name
          }
        }
      }
    }
  }
`;

const CrossingHistoryQuery = gql`
  query crossingHistory($crossingId:Int!) {
    allStatusUpdates(condition:{crossingId:$crossingId}) {
      nodes {
        id
      }
    }
  }
`;

export default compose(
  graphql(CrossingByIdQuery, {
    name: 'CrossingByIdQuery',
    options: (ownProps) => ({
      variables: {
        crossingId: ownProps.match.params.id
      }
    })
  }),
  graphql(CrossingHistoryQuery, {
    name: 'CrossingHistoryQuery',
    options: (ownProps) => ({
      variables: {
        crossingId: ownProps.match.params.id
      }
    })
  })
)(CrossingDetailPage);
