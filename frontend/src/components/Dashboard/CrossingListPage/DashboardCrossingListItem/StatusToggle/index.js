import React from 'react';
import PropTypes from 'prop-types';

import * as statusConstants from 'constants/StatusConstants';
import StatusToggleItem from './StatusToggleItem';
import './StatusToggle.css';

import StatusCautionSvg from 'images/status-caution.svg';
import StatusCautionInactiveSvg from 'images/status-caution-inactive.svg';
import StatusClosedSvg from 'images/status-closed.svg';
import StatusClosedInactiveSvg from 'images/status-closed-inactive.svg';
import StatusLongTermSvg from 'images/status-long-term.svg';
import StatusLongTermInactiveSvg from 'images/status-long-term-inactive.svg';
import StatusOpenSvg from 'images/status-open.svg';
import StatusOpenInactiveSvg from 'images/status-open-inactive.svg';

export default function StatusToggle({
  activeStatus,
  activateOpenToggle,
  activateCautionToggle,
  activateClosedToggle,
  activateLongtermToggle,
}) {
  return (
    <div className="StatusToggleContainer">
      <StatusToggleItem
        isActive={activeStatus === statusConstants.OPEN}
        className="StatusToggleItem__open"
        iconSrc={StatusOpenInactiveSvg}
        activeIconSrc={StatusOpenSvg}
        alt="Open"
        onClick={activateOpenToggle}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.CAUTION}
        className="StatusToggleItem__caution"
        iconSrc={StatusCautionInactiveSvg}
        activeIconSrc={StatusCautionSvg}
        alt="Caution"
        onClick={activateCautionToggle}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.CLOSED}
        className="StatusToggleItem__closed"
        iconSrc={StatusClosedInactiveSvg}
        activeIconSrc={StatusClosedSvg}
        alt="Closed"
        onClick={activateClosedToggle}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.LONGTERM}
        className="StatusToggleItem__longterm"
        iconSrc={StatusLongTermInactiveSvg}
        activeIconSrc={StatusLongTermSvg}
        alt="Closed Long-Term"
        onClick={activateLongtermToggle}
      />
    </div>
  );
}

StatusToggle.propTypes = {
  activeStatus: PropTypes.number.isRequired,
  activateOpenToggle: PropTypes.func.isRequired,
  activateCautionToggle: PropTypes.func.isRequired,
  activateClosedToggle: PropTypes.func.isRequired,
  activateLongtermToggle: PropTypes.func.isRequired,
};
