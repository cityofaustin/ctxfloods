import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './Form.css';

export default function TextArea({
  className,
  onChange,
  isDisabled,
  ...props
}) {
  return (
    <textarea
      onChange={onChange}
      className={classNames(
        'Shared__text-area',
        { 'Shared__text-area--disabled': isDisabled },
        className,
      )}
      disabled={isDisabled}
      {...props}
    />
  );
}

TextArea.propTypes = {
  className: PropTypes.string,
  onChange: PropTypes.func,
  isDisabled: PropTypes.bool,
};

TextArea.defaultProps = {
  isDisabled: false,
};
