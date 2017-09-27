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

  render () {
    return (
      <div className="StatusToggleContainer">
        <div 
          className={"StatusToggle__open" + (this.state.selectedStatus === STATUS_OPEN ? "--selected" : "")}
          onClick={this.statusClicked.bind(this, STATUS_OPEN)}>
          <FontAwesome name='circle-o' />
        </div>
        <div className={"StatusToggle__caution" + (this.state.selectedStatus === STATUS_CAUTION ? "--selected" : "")}
          onClick={this.statusClicked.bind(this, STATUS_CAUTION)}>
          <FontAwesome name='exclamation-triangle' />
        </div>
        <div className={"StatusToggle__closed" + (this.state.selectedStatus === STATUS_CLOSED ? "--selected" : "")}
          onClick={this.statusClicked.bind(this, STATUS_CLOSED)}>
          <FontAwesome name='times' />
        </div>
        <div className={"StatusToggle__longterm" + (this.state.selectedStatus === STATUS_LONGTERM ? "--selected" : "")}
          onClick={this.statusClicked.bind(this, STATUS_LONGTERM)}>
          <FontAwesome name='times' style={{ textDecoration: 'underline' }} />
        </div>
      </div>
    );
  }
}

export default StatusToggle;
