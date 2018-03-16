import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './DashboardCrossingListItemControl.css';

export default function DashboardCrossingListItemControl({
  isRequired,
  label,
  children,
  className,
}) {
  return (
    <div className={classNames("DashboardCrossingListItem__control", className)}>
      <div className="DashboardCrossingListItem__control-meta">
        <div className="DashboardCrossingListItem__control-label">{label}</div>
        {isRequired && (
          <div className="DashboardCrossingListItem__control-required">
            Required
          </div>
        )}
      </div>
      <div className="DashboardCrossingListItem__control-children">
        {children}
      </div>
    </div>
  );
}

DashboardCrossingListItemControl.propTypes = {
  isRequired: PropTypes.bool,
  label: PropTypes.node.isRequired,
  children: PropTypes.node.isRequired,
  className: PropTypes.string.isRequired,
};

DashboardCrossingListItemControl.defaultProps = {
  DashboardCrossingListItemControl: false,
};
