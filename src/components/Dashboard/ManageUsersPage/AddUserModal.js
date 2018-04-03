import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';
import generator from 'generate-password';
import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';

class AddUserModal extends Component {
  render() {
    const { userAdded, emailSent, onClose, errorMessage } = this.props;

    return (
      <Modal
        title="Adding User"
        isOpen
        onClose={onClose}
        footer={
          <div>
            <ButtonPrimary
              onClick={onClose}
              disabled={!(userAdded && emailSent) && !errorMessage}
            >
              OK
            </ButtonPrimary>
          </div>
        }
      >
        {!(userAdded && emailSent) && !errorMessage && (
          <div>
            {!userAdded && <p>Adding User to Database</p>}
            {(userAdded && !emailSent) && <p>Sending registration email</p>}
            <div>
              <FontAwesome name="spinner" size="lg" className="fa-spin" />
            </div>
          </div>
        )}
        {userAdded && emailSent &&
          !errorMessage && <p>Success!</p>}
        {errorMessage && (
          <ModalErrorMessage>{errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

export default AddUserModal;
