import React from 'react';
import './StatusToggle.css';

class StatusToggle extends React.Component {

  render () {
    return (
      <div className="flexcontainer">
        <div className="StatusToggle__open"> O </div>
        <div className="StatusToggle__caution"> Δ </div>
        <div className="StatusToggle__closed"> x </div>
        <div className="StatusToggle__longterm"> X </div>
      </div>
    );

  }

}

export default StatusToggle;
