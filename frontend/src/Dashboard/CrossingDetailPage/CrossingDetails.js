import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import React, { Component } from 'react';

class CrossingDetails extends Component {
  render() {
    if ( !this.props.data || this.props.data.loading ) {
      return (<div>Loading</div>)
    }

    debugger;
    const crossing = this.props.data.crossingById;
    const community = crossing.communityCrossingsByCrossingId.nodes[0].communityByCommunityId;

    return (
      <div>
        <div>Crossing Details: {this.props.crossingId}</div>
        <div> {crossing.humanCoordinates} </div>
        <input type='text' defaultValue={crossing.name}></input>
        <div> {crossing.humanAddress} </div>
        <input type='text' defaultValue={crossing.description}></input>
        <input type='text' defaultValue={community.name}></input>
        <div> SAVE CROSSING </div>
        <div> DELETE CROSSING </div>
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
  options: ({ crossingId }) => ({ variables: { crossingId } }),
})(CrossingDetails);
