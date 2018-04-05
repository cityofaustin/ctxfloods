import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import React, { Component } from 'react';
import PropTypes from 'prop-types';

import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import userActiveFragment from 'components/Dashboard/ManageUsersPage/queries/userActiveFragment';

class ArchiveUserModal extends Component {
  static propTypes = {
    user: PropTypes.object.isRequired,
    onClose: PropTypes.func.isRequired,
  };

  constructor(...args) {
    super(...args);

    this.state = {
      errorMessage: null,
    };
  }

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  reactivateUser = () => {
    debugger;
  }

  deactivateUser = () => {
    this.props
      .deactivateUserMutation({
        variables: {
          userId: this.props.user.id,
        },
        update: (store, { data: { deactivateUser } }) => {
          const deactivatedUser = deactivateUser.user;
          store.writeFragment({
            id: 'User:' + deactivatedUser.id,
            fragment: userActiveFragment,
            data: deactivatedUser,
          });
        },
      })
      .then(({ data }) => {
        this.props.onClose();
      })
      .catch(err => {
        console.error(err);
        this.setState({ errorMessage: err.message });
      });
  };

  render() {
    const { user } = this.props;

    return (
      <Modal
        title={user.active ? "Deactivate User" : "Reactivate User"}
        isOpen
        onClose={this.props.onClose}
        footer={
          <div>
            <ButtonPrimary
              className="ArchiveUserModal__primary-button"
              onClick={user.active ? this.deactivateUser : this.reactivateUser}
            >
              {user.active ? "Deactivate" : "Reactivate"}
            </ButtonPrimary>
            <ButtonSecondary onClick={this.props.onClose}>
              Cancel
            </ButtonSecondary>
          </div>
        }
      >
        <p>This will {user.active ? "deactivate" : "reactivate"} {user.firstName} {user.lastName}.</p>
        <p>Do you want to continue?</p>
        {this.state.errorMessage && (
          <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

const deactivateUserMutation = gql`
  mutation($userId:Int!) {
    deactivateUser(input: {userId: $userId}) {
      user {
        ...userActive
      }
    }
  }
  ${userActiveFragment}
`;

export default graphql(deactivateUserMutation, {
  name: 'deactivateUserMutation',
})(ArchiveUserModal);
