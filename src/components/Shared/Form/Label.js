import React from 'react';
import PropTypes from 'prop-types';

export default function Label({ children }) {
  return <div className="Shared__label">
    {children}
  </div>
}

Label.propTypes = {
  children: PropTypes.node.isRequired,
}
