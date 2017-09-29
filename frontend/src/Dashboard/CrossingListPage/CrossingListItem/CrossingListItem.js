import React from 'react';
import FontAwesome from 'react-fontawesome';
import Location from './Location';
import DateTime from './DateTime';
import StatusToggle from './StatusToggle';
import Dropdown from './Dropdown';
import './CrossingListItem.css';

class CrossingListItem extends React.Component {

  render () {
    var show = [];
    switch(this.props.status) {
      case 'Open':
        show = this.props.dirty ? ['cancelSave'] : [];
        break;
      case 'Caution':
      case 'Closed':
        show = this.props.dirty ? ['reason', 'cancelSave'] : ['reason'];
        break;
      case 'Long Term Closure':
        show = this.props.dirty ? ['reason', 'duration', 'cancelSave'] : ['reason', 'duration'];
        break;  
    }

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
              <div className="ControlLabel">Status: {this.props.status}</div>
              <StatusToggle status={this.props.status} />
            </div>
            <div className="flexitem">
              <div className={show.includes('reason') ? "" : "hidden"}>
                <div className="ControlLabelContainer">
                  <div className="ControlLabel">Reason</div>
                  <div className="required">{this.props.dirty ? "Required" : ""}</div>
                </div>
                <Dropdown />
              </div>
            </div>
            <div className="flexitem">
              <div className="ControlLabel">Notes to the public</div>
              <input className="NotesTextBox" type="text" />
            </div>
          </div>
          <div className="CrossingListItemFlexContainer">
            <div className="flexitem" />
            <div className="flexitem">
              <div className={show.includes('duration') ? "" : "hidden"}>
                <div className="ControlLabelContainer">
                  <div className="ControlLabel">Duration</div>
                  <div className="required">{this.props.dirty ? "Required" : ""}</div>
                </div>
                <Dropdown />
              </div>
            </div>
            <div className="flexitem">
              <div className={show.includes('cancelSave') ? "" : "hidden"}>
                <div className="flexcontainer">              
                  <div className="CancelButton">Cancel</div>
                  <div className="SaveButton">Save</div>
                </div>
              </div>
            </div>
          </div>
      </div>
      </div>
    );
  }
}

export default CrossingListItem;
