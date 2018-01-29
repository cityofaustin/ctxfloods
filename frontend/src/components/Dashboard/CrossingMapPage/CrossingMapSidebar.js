import React, { Component } from 'react';
import CrossingMapOverlay from 'components/Dashboard/CrossingMapPage/CrossingMapOverlay';
import 'components/Dashboard/CrossingMapPage/CrossingMapPage.css';

class CrossingMapSidebar extends Component {
  constructor(props) {
    super(props);

    this.state = {
      visible: false,
    };
  }

  toggleSidebar = () => {
    this.setState({visible: !this.state.visible});
  }

  render() {
    const { visible } = this.state;

    return (
      <div className="CrossingMapPage_sidebar-container">{visible && (
        <div className="CrossingMapPage_sidebar-content"> SIDEBAR </div>
        )}
        <div className="CrossingMapPage_sidebar-toggle" onClick={this.toggleSidebar}> SHOW HIDE TOGGLE </div>
      </div>
    );
  }
}

export default CrossingMapSidebar;


/*

{selectedCrossingId && <CrossingMapOverlay crossingId={selectedCrossingId} currentUser={currentUser} selectCrossing={this.selectCrossing}/>}

*/
