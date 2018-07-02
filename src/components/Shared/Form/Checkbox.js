import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './Form.css';

export default function Checkbox({
  value,
  checked,
  children,
  className,
  onChange,
  ...props
}) {
  return (
    <div className={classNames('Shared__checkbox', className)}>
      <label>
        <input
          type="checkbox"
          value={value}
          checked={checked}
          onChange={onChange}
        />
        {children}
      </label>
    </div>
  );
}

Checkbox.propTypes = {
  value: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.bool,
    PropTypes.number,
  ]).isRequired,
  checked: PropTypes.bool.isRequired,
  children: PropTypes.node.isRequired,
  className: PropTypes.string,
  onChange: PropTypes.func.isRequired,
};
