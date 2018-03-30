import React from 'react';
import PropTypes from 'prop-types';

export default function InputDescription({ children, ...props }) {
  return (
    <div className="Shared__input-description" {...props}>
      {children}
    </div>
  );
}

InputDescription.propTypes = {
  children: PropTypes.node.isRequired,
};
