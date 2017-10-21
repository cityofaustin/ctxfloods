import React, { Component } from 'react';

class CrossingDetails extends Component {
  render() {
    return (
      <div>
        <div>Crossing Details: {this.props.crossingId}</div>
        <div> GPS </div>
        <input type='text' defaultValue='name'></input>
        <div> Street Address </div>
        <input type='text' defaultValue='location notes'></input>
        <input type='text' defaultValue='community'></input>
        <div> SAVE CROSSING </div>
        <div> DELETE CROSSING </div>
      </div>
    );
  }

}

export default CrossingDetails;
