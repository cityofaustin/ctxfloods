import React, { Component } from 'react';
import CrossingDetails from './CrossingDetails';
import CrossingStatusHistory from './CrossingStatusHistory';

class CrossingDetailPage extends Component {
  render() {
    return (
      <div>
        <CrossingDetails/>
        <CrossingStatusHistory/>
      </div>
    );
  }

}

export default CrossingDetailPage;
