import React from 'react';
import './StatusToggle.css';

const STATUS_OPEN = Symbol('open');
const STATUS_CAUTION = Symbol("caution");
const STATUS_CLOSED = Symbol("closed");
const STATUS_LONGTERM = Symbol("longterm");

class StatusToggle extends React.Component {
  state = {
    selectedStatus: STATUS_OPEN,
  }

  render () {
    return (
      <div className="StatusToggleContainer">
        <div className={"StatusToggle__open" + (this.state.selectedStatus === STATUS_OPEN ? "--selected" : "")}> O </div>
        <div className={"StatusToggle__caution" + (this.state.selectedStatus === STATUS_CAUTION ? "--selected" : "")}> Δ </div>
        <div className={"StatusToggle__closed" + (this.state.selectedStatus === STATUS_CLOSED ? "--selected" : "")}> X </div>
        <div className={"StatusToggle__longterm" + (this.state.selectedStatus === STATUS_LONGTERM ? "--selected" : "")}> X </div>
      </div>
    );

  }

}

export default StatusToggle;
