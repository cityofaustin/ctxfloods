import React from 'react';
import FontAwesome from 'react-fontawesome';
import Location from './Location';
import DateTime from './DateTime';
import StatusToggle from './StatusToggle';
import './CrossingListItem.css';

class CrossingListItem extends React.Component {

  render () {
    return (
      <div style={{width: "1280px"}}>
        <img src={require('./example.png')} style={{"height":"348px"}} />
          <div className="CrossingListItemContainer">
            <div className="CrossingName">Spurlock Valley</div>
            <Location />
            <DateTime />
          </div>
          <div className="CrossingListItemContainer">
            <div className="flexitem">
              <div className="StatusText">Status: Open</div>
              <StatusToggle status={this.props.status} />
            </div>
            <div className="flexitem">REASON</div>
            <div className="flexitem">NOTES</div>
          </div>
      </div>
    );
  }
}

export default CrossingListItem;
