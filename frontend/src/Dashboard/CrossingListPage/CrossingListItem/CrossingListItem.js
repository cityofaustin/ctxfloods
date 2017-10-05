import React from 'react';
import FontAwesome from 'react-fontawesome';
import Location from './Location';
import DateTime from './DateTime';
import StatusToggle from './StatusToggle';
import Dropdown from './Dropdown';
import './CrossingListItem.css';
import * as statusConstants from './StatusConstants';

class CrossingListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedStatus: props.savedStatus };
  }

  openClicked = () => { this.setState({ selectedStatus: statusConstants.OPEN }) };
  cautionClicked = () => { this.setState({ selectedStatus: statusConstants.CAUTION }) };
  closedClicked = () => { this.setState({ selectedStatus: statusConstants.CLOSED }) };
  longtermClicked = () => { this.setState({ selectedStatus: statusConstants.LONGTERM }) };

  render () {
    var show = [];
    switch(this.state.selectedStatus) {
      case statusConstants.OPEN:
        show = this.props.dirty ? ['cancelSave'] : [];
        break;
      case statusConstants.CAUTION:
      case statusConstants.CLOSED:
        show = this.props.dirty ? ['reason', 'cancelSave'] : ['reason'];
        break;
      case statusConstants.LONGTERM:
        show = this.props.dirty ? ['reason', 'duration', 'cancelSave'] : ['reason', 'duration'];
        break;  
    }

    return (
      <div>
      <div style={{height: '12px', backgroundColor: '#f5f3f7'}}></div>
      <div className={this.props.dirty ? "DirtyBorder" : ""}>
        <div className="CrossingListItemContainer">
          <div className="CrossingListItemFlexContainer">
            <div className="CrossingName">Spurlock Valley</div>
            <Location />
            <DateTime />
          </div>
          <div className="CrossingListItemFlexContainer">
            <div className="flexitem">
              <div className="ControlLabel">Status: {this.props.status}</div>
              <StatusToggle 
                status={this.state.selectedStatus}
                openClicked={this.openClicked}
                cautionClicked={this.cautionClicked}
                closedClicked={this.closedClicked}
                longtermClicked={this.longtermClicked} />
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
          <div className={show.includes('duration') || show.includes('cancelSave') ? "CrossingListItemFlexContainer" : ""}>
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
      <div style={{height: '12px', backgroundColor: '#f5f3f7'}}></div>
      </div>
    );
  }
}

export default CrossingListItem;
