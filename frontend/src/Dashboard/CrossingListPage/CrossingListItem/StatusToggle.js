import React from 'react';
import FontAwesome from 'react-fontawesome';
import './StatusToggle.css';

const STATUS_OPEN = Symbol('open');
const STATUS_CAUTION = Symbol("caution");
const STATUS_CLOSED = Symbol("closed");
const STATUS_LONGTERM = Symbol("longterm");

class StatusToggle extends React.Component {
  constructor(props) {
    super(props);
    switch (props.status) {
      case 'open':
        this.state = { selectedStatus: STATUS_OPEN }
        break;
      case 'caution':
        this.state = { selectedStatus: STATUS_CAUTION }
        break;
      case 'closed':
        this.state = { selectedStatus: STATUS_CLOSED }
        break;
      case 'longterm':
        this.state = { selectedStatus: STATUS_LONGTERM }
        break;
    }
  }

  statusClicked(status) {
    this.setState({ selectedStatus: status });
  }

  statusHovered(status) {
    this.setState({ hoveredStatus: status });
  }

  clearHover() {
    this.setState({ hoveredStatus: null });
  }

  render () {
    return (
      <div className="StatusToggleContainer">
        <div 
          className={"StatusToggle__open" + 
                    (this.state.selectedStatus === STATUS_OPEN ? "--selected" : "") +
                    (this.state.hoveredStatus === STATUS_OPEN ? " hover" : "")}
          onClick={this.statusClicked.bind(this, STATUS_OPEN)}
          onMouseOver={this.statusHovered.bind(this, STATUS_OPEN)}
          onMouseLeave={this.clearHover.bind(this)}>
          <FontAwesome name='circle-o' />
        </div>
        <div className={"StatusToggle__caution" + 
                       (this.state.selectedStatus === STATUS_CAUTION ? "--selected" : "") + 
                       (this.state.hoveredStatus === STATUS_CAUTION ? " hover" : "")}
          onClick={this.statusClicked.bind(this, STATUS_CAUTION)}
          onMouseOver={this.statusHovered.bind(this, STATUS_CAUTION)}
          onMouseLeave={this.clearHover.bind(this)}>
          <FontAwesome name='exclamation-triangle' />
        </div>
        <div className={"StatusToggle__closed" + 
                       (this.state.selectedStatus === STATUS_CLOSED ? "--selected" : "") +
                       (this.state.hoveredStatus === STATUS_CLOSED ? " hover" : "")}
          onClick={this.statusClicked.bind(this, STATUS_CLOSED)}
          onMouseOver={this.statusHovered.bind(this, STATUS_CLOSED)}
          onMouseLeave={this.clearHover.bind(this)}>
          <FontAwesome name='times' />
        </div>
        <div className={"StatusToggle__longterm" + 
                       (this.state.selectedStatus === STATUS_LONGTERM ? "--selected" : "") +
                       (this.state.hoveredStatus === STATUS_LONGTERM ? " hover" : "")}
          onClick={this.statusClicked.bind(this, STATUS_LONGTERM)}
          onMouseOver={this.statusHovered.bind(this, STATUS_LONGTERM)}
          onMouseLeave={this.clearHover.bind(this)}>
          <FontAwesome name='times' style={{ textDecoration: 'underline' }} />
        </div>
      </div>
    );
  }
}

export default StatusToggle;
