import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingDetails from './CrossingDetails';
import CrossingStatusHistory from './CrossingStatusHistory';


class CrossingDetailPage extends Component {
  render() {
    if ( !this.props.data || this.props.data.loading ) {
      return (<div>Loading</div>)
    }

    const crossing = this.props.data.crossingById;
    const community = crossing.communityCrossingsByCrossingId.nodes[0].communityByCommunityId;

    return (
      <div>
        <CrossingDetails crossing={crossing} community={community}/>
        <CrossingStatusHistory crossingId={this.props.crossingId}/>
      </div>
    );
  }

}

const CrossingByIdQuery = gql`
  query crossingById($crossingId:Int!) {
    crossingById(id:$crossingId) {
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

export default graphql(CrossingByIdQuery, {
  options: (ownProps) => ({ variables: { crossingId: ownProps.match.params.id } }),
})(CrossingDetailPage);
