import React, { Component } from 'react';
import CrossingMap from '../../Map/CrossingMap'; 
import './CrossingUpdates.css';

class CrossingUpdates extends Component {
  state = {
    activeTab: 'list'
  }

  changeTab(tab) {
    this.setState({activeTab: tab});
  }

  render() {
    return (
      <div className="CrossingUpdates">
        <div className="flexcontainer">
          <div className="CrossingUpdates__tab--header">SHOW: </div>
          <div className={this.state.activeTab === 'list' ? 'CrossingUpdates__tab--active' : 'CrossingUpdates__tab--inactive'}
               onClick={this.changeTab.bind(this,'list')}
          >LIST</div>
          <div className="CrossingUpdates__tab--header"> | </div>
          <div className={this.state.activeTab === 'map' ? 'CrossingUpdates__tab--active' : 'CrossingUpdates__tab--inactive'}
               onClick={this.changeTab.bind(this,'map')} 
          >MAP</div>
        </div>
        {this.state.activeTab === 'map' ? 
          <div className="CrossingUpdates__map-container">
            <CrossingMap mapHeight="80vh" mapWidth="80vw"/>
          </div>
        :
          <div>LIST VIEW</div>
        }
      </div>
    );
  }

}


export default CrossingUpdates;
