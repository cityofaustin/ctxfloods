import React from 'react';
import FontAwesome from 'react-fontawesome';
import Location from './Location';
import './CrossingListItem.css';

class CrossingListItem extends React.Component {

  render () {
    return (
      <div style={{width: "1280px"}}>
        <img src={require('./example.png')} style={{"height":"348px"}} />
          <div className="CrossingListItemContainer">
            <div className="CrossingName">Spurlock Valley</div>
            <Location />
            <div className="flexitem">DATETIME</div>
          </div>
          <div className="CrossingListItemContainer">
            <div className="flexitem">STATUS</div>
            <div className="flexitem">REASON</div>
            <div className="flexitem">NOTES</div>
          </div>
      </div>
    );
  }
}

export default CrossingListItem;
