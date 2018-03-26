import React from 'react';
import ReactModal from 'react-modal';
import PropTypes from 'prop-types';
import FontAwesome from 'react-fontawesome';

import './Modal.css';

try {
  ReactModal.setAppElement('#root');
} catch (err) {
  // Ignore error from #root not existing when running tests
}

export default function Modal({ title, children, footer, onClose, ...props }) {
  return (
    <ReactModal
      contentLabel={title}
      onRequestClose={onClose}
      className="FloodsModalDialog"
      overlayClassName="FloodsModalOverlay"
      {...props}
    >
      <div className="FloodsModal">
        <div className="FloodsModalHeader">
          <div className="FloodsModalHeader__title">{title}</div>
          <div
            className="FloodsModalHeader__close"
            role="button"
            onClick={onClose}
          >
            <FontAwesome name="times-circle" ariaLabel="Close" />
          </div>
        </div>
        <div className="FloodsModalContent">{children}</div>
        <div className="FloodsModalFooter">{footer}</div>
      </div>
    </ReactModal>
  );
}

Modal.propTypes = {
  title: PropTypes.string.isRequired,
  isOpen: PropTypes.bool.isRequired,
  onClose: PropTypes.func.isRequired,
  children: PropTypes.node.isRequired,
  footer: PropTypes.node,
};
