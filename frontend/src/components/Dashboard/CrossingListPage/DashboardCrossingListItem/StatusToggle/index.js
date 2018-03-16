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
  toggleOpen,
  toggleCaution,
  toggleClosed,
  toggleLongterm,
}) {
  return (
    <div className="StatusToggleContainer">
      <StatusToggleItem
        isActive={activeStatus === statusConstants.OPEN}
        className="StatusToggleItem__open"
        iconSrc={StatusOpenInactiveSvg}
        activeIconSrc={StatusOpenSvg}
        alt="Open"
        onClick={toggleOpen}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.CAUTION}
        className="StatusToggleItem__caution"
        iconSrc={StatusCautionInactiveSvg}
        activeIconSrc={StatusCautionSvg}
        alt="Caution"
        onClick={toggleCaution}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.CLOSED}
        className="StatusToggleItem__closed"
        iconSrc={StatusClosedInactiveSvg}
        activeIconSrc={StatusClosedSvg}
        alt="Closed"
        onClick={toggleClosed}
      />
      <StatusToggleItem
        isActive={activeStatus === statusConstants.LONGTERM}
        className="StatusToggleItem__longterm"
        iconSrc={StatusLongTermInactiveSvg}
        activeIconSrc={StatusLongTermSvg}
        alt="Closed Long-Term"
        onClick={toggleLongterm}
      />
    </div>
  );
}

StatusToggle.propTypes = {
  activeStatus: PropTypes.string.isRequired,
  toggleOpen: PropTypes.func.isRequired,
  toggleCaution: PropTypes.func.isRequired,
  toggleClosed: PropTypes.func.isRequired,
  toggleLongterm: PropTypes.func.isRequired,
};
