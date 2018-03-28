import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './EditUserControl.css';

export default function EditUserControl({
  isRequired,
  label,
  children,
  className,
}) {
  return (
    <div
      className={classNames('EditUser__control', className)}
    >
      <div className="EditUser__control-meta">
        <div className="EditUser__control-label">{`${label}${isRequired ? '*' : ''}`}</div>
      </div>
      <div className="EditUser__control-children">
        {children}
      </div>
    </div>
  );
}

EditUserControl.propTypes = {
  isRequired: PropTypes.bool,
  label: PropTypes.node.isRequired,
  children: PropTypes.node.isRequired,
  className: PropTypes.string,
};

EditUserControl.defaultProps = {
  EditUserControl: false,
};
