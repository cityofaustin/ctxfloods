import React from 'react';

import './ModalErrorMessage.css';

export default function ModalErrorMessage({ children }) {
  if (!children) {
    return null;
  }
  return <div className="ModalErrorMessage">{children}</div>;
}
