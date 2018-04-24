import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';
import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';

class ActivateUserModal extends Component {
  render() {
    const { userActivated, emailSent, onClose, errorMessage, userIsNew } = this.props;

    return (
      <Modal
        title={userIsNew ? "Adding User" : "Reactivating User"}
        isOpen
        onClose={onClose}
        footer={
          <div>
            <ButtonPrimary
              onClick={onClose}
              disabled={!(userActivated && emailSent) && !errorMessage}
            >
              OK
            </ButtonPrimary>
          </div>
        }
      >
        {!(userActivated && emailSent) &&
          !errorMessage && (
            <div>
              {!userActivated && <p>{userIsNew ? "Adding User to Database" : "Reactivating User in Database"}</p>}
              {userActivated && !emailSent && <p>Sending registration email</p>}
              <div>
                <FontAwesome name="spinner" size="lg" className="fa-spin" />
              </div>
            </div>
          )}
        {userActivated && emailSent && !errorMessage && <p>Success!</p>}
        {errorMessage && <ModalErrorMessage>{errorMessage}</ModalErrorMessage>}
      </Modal>
    );
  }
}

export default ActivateUserModal;
