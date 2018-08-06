import React from 'react';
import PropTypes from 'prop-types';
import classnames from 'classnames';
import FontAwesome from 'react-fontawesome';

import './Button.css';

export default function Button({
  onClick,
  className,
  children,
  loading,
  disabled,
  ...props
}) {
  return (
    <button
      className={classnames('Shared__button', className)}
      onClick={onClick}
      disabled={!!(loading || disabled)}
      {...props}
    >
      {loading && (
        <React.Fragment>
          <FontAwesome
            name="spinner"
            size="lg"
            className="fa-spin Shared__button-spinner"
          />
          Loading
        </React.Fragment>
      )}
      {!loading && children}
    </button>
  );
}

export const ButtonPropTypes = {
  onClick: PropTypes.func.isRequired,
  className: PropTypes.string,
  children: PropTypes.node.isRequired,
  loading: PropTypes.bool,
};

Button.propTypes = ButtonPropTypes;

Button.defaultProps = {
  loading: false,
};
