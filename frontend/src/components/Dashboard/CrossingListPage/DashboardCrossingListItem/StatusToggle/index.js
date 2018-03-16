import React from 'react';

import * as statusConstants from 'constants/StatusConstants';
import StatusItem from './StatusItem';
import './StatusToggle.css';

import StatusCautionSvg from 'images/status-caution.svg';
import StatusCautionInactiveSvg from 'images/status-caution-inactive.svg';
import StatusClosedSvg from 'images/status-closed.svg';
import StatusClosedInactiveSvg from 'images/status-closed-inactive.svg';
import StatusLongTermSvg from 'images/status-long-term.svg';
import StatusLongTermInactiveSvg from 'images/status-long-term-inactive.svg';
import StatusOpenSvg from 'images/status-open.svg';
import StatusOpenInactiveSvg from 'images/status-open-inactive.svg';

export default class StatusToggle extends React.Component {
  render() {
    return (
      <div className="StatusToggleContainer">
        <StatusItem
          isActive={this.props.status === statusConstants.OPEN}
          className="StatusToggle__open"
          iconSrc={StatusOpenInactiveSvg}
          activeIconSrc={StatusOpenSvg}
          alt="Open"
          onClick={this.props.openClicked}
        />
        <StatusItem
          isActive={this.props.status === statusConstants.CAUTION}
          className="StatusToggle__caution"
          iconSrc={StatusCautionInactiveSvg}
          activeIconSrc={StatusCautionSvg}
          alt="Caution"
          onClick={this.props.cautionClicked}
        />
        <StatusItem
          isActive={this.props.status === statusConstants.CLOSED}
          className="StatusToggle__closed"
          iconSrc={StatusClosedInactiveSvg}
          activeIconSrc={StatusClosedSvg}
          alt="Closed"
          onClick={this.props.closedClicked}
        />
        <StatusItem
          isActive={this.props.status === statusConstants.LONGTERM}
          className="StatusToggle__longterm"
          iconSrc={StatusLongTermInactiveSvg}
          activeIconSrc={StatusLongTermSvg}
          alt="Closed Long-Term"
          onClick={this.props.longtermClicked}
        />
      </div>
    );
  }
}
