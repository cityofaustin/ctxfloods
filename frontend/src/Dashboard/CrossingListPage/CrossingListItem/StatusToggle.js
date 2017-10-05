import React from 'react';
import FontAwesome from 'react-fontawesome';
import './StatusToggle.css';
import * as statusConstants from './StatusConstants';

class StatusToggle extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedStatus: props.status };
  }

  openClicked = () => { this.setState({ selectedStatus: statusConstants.OPEN }) };
  cautionClicked = () => { this.setState({ selectedStatus: statusConstants.CAUTION }) };
  closedClicked = () => { this.setState({ selectedStatus: statusConstants.CLOSED }) };
  longtermClicked = () => { this.setState({ selectedStatus: statusConstants.LONGTERM }) };

  openHovered = () => { this.setState({ hoveredStatus: statusConstants.OPEN }) };
  cautionHovered = () => { this.setState({ hoveredStatus: statusConstants.CAUTION }) };
  closedHovered = () => { this.setState({ hoveredStatus: statusConstants.CLOSED }) };
  longtermHovered = () => { this.setState({ hoveredStatus: statusConstants.LONGTERM }) };

  clearHover = () => { this.setState({ hoveredStatus: null }) };

  render () {
    return (
      <div className="StatusToggleContainer">
        <div 
          className={"StatusToggle__open" + 
                    (this.state.selectedStatus === statusConstants.OPEN ? "--selected" : "") +
                    (this.state.hoveredStatus === statusConstants.OPEN ? " hover" : "")}
          onClick={this.openClicked}
          onMouseOver={this.openHovered}
          onMouseLeave={this.clearHover} >
          <FontAwesome name='circle-o' />
        </div>
        <div className={"StatusToggle__caution" + 
                       (this.state.selectedStatus === statusConstants.CAUTION ? "--selected" : "") + 
                       (this.state.hoveredStatus === statusConstants.CAUTION ? " hover" : "")}
          onClick={this.cautionClicked}
          onMouseOver={this.cautionHovered}
          onMouseLeave={this.clearHover} >
          <FontAwesome name='exclamation-triangle' />
        </div>
        <div className={"StatusToggle__closed" + 
                       (this.state.selectedStatus === statusConstants.CLOSED ? "--selected" : "") +
                       (this.state.hoveredStatus === statusConstants.CLOSED ? " hover" : "")}
          onClick={this.closedClicked}
          onMouseOver={this.closedHovered}
          onMouseLeave={this.clearHover} >
          <FontAwesome name='times' />
        </div>
        <div className={"StatusToggle__longterm" + 
                       (this.state.selectedStatus === statusConstants.LONGTERM ? "--selected" : "") +
                       (this.state.hoveredStatus === statusConstants.LONGTERM ? " hover" : "")}
          onClick={this.longtermClicked}
          onMouseOver={this.longtermHovered}
          onMouseLeave={this.clearHover} >
          <FontAwesome name='times' style={{ textDecoration: 'underline' }} />
        </div>
      </div>
    );
  }
}

export default StatusToggle;
