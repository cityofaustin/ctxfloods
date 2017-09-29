import React from 'react';
import FontAwesome from 'react-fontawesome';
import Location from './Location';
import DateTime from './DateTime';
import StatusToggle from './StatusToggle';
import Dropdown from './Dropdown';
import './CrossingListItem.css';

class CrossingListItem extends React.Component {

  render () {
    return (
      <div>
      <img src={require('./example.png')} style={{"height":"348px"}} />
      <div className="CrossingListItemContainer">
          <div className="CrossingListItemFlexContainer">
            <div className="CrossingName">Spurlock Valley</div>
            <Location />
            <DateTime />
          </div>
          <div className="CrossingListItemFlexContainer">
            <div className="flexitem">
              <div className="ControlLabel">Status: Open</div>
              <StatusToggle status={this.props.status} />
            </div>
            <div className="flexitem">
              <div className="ControlLabel">Reason</div>
              <Dropdown />
            </div>
            <div className="flexitem">
              <div className="ControlLabel">Notes to the public</div>
              <input className="NotesTextBox" type="text" />
            </div>
          </div>
          <div className="CrossingListItemFlexContainer">
            <div className="flexitem" />
            <div className="flexitem">
              <div className="ControlLabel">Duration</div>
              <Dropdown />
            </div>
            <div className="flexitem">
              <div className="flexcontainer">
                <div className="CancelButton">Cancel</div>
                <div className="SaveButton">Save</div>
              </div>
            </div>
          </div>
      </div>
      </div>
    );
  }
}

export default CrossingListItem;
