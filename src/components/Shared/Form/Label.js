import React from 'react';
import PropTypes from 'prop-types';

export default function Label({ children, ...props }) {
  return (
    <label className="Shared__label" {...props}>
      {children}
    </label>
  );
}

Label.propTypes = {
  children: PropTypes.node.isRequired,
};
