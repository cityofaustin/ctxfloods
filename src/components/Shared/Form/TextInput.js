import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './Form.css';

export default function TextInput({
  className,
  onChange,
  isDisabled,
  ...props
}) {
  return (
    <input
      type="text"
      onChange={onChange}
      className={classNames(
        'Shared__text-input',
        { 'Shared__text-input--disabled': isDisabled },
        className,
      )}
      disabled={isDisabled}
      {...props}
    />
  );
}

TextInput.propTypes = {
  className: PropTypes.string,
  onChange: PropTypes.func,
  isDisabled: PropTypes.bool,
};

TextInput.defaultProps = {
  isDisabled: false,
};
