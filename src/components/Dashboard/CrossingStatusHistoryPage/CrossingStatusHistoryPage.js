import React, { Component } from 'react';
import CrossingStatusHistory from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistory';

class CrossingStatusHistoryPage extends Component {
  render() {
    return (
      <CrossingStatusHistory
        {...this.props}
        showNames
        maxRows={500}
      />
    );
  }
}

export default CrossingStatusHistoryPage;
