import React from 'react';
import PropTypes from 'prop-types';

export default function InputDescription({ children }) {
  return <div className="Shared__input-description">{children}</div>;
}

InputDescription.propTypes = {
  children: PropTypes.node.isRequired,
};
