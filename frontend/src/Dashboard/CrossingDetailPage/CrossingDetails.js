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

    return (
      <div>
        <div>Crossing Details: {this.props.crossingId}</div>
        <div> GPS </div>
        <input type='text' defaultValue={crossing.name}></input>
        <div> Street Address </div>
        <input type='text' defaultValue='location notes'></input>
        <input type='text' defaultValue='community'></input>
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
    }
  }
`;

export default graphql(CrossingByIdQuery, {
  options: ({ crossingId }) => ({ variables: { crossingId } }),
})(CrossingDetails);
