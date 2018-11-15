import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import generator from 'generate-password';

import { logError } from 'services/logger';
import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';
import ActivateUserModal from 'components/Dashboard/ManageUsersPage/ActivateUserModal';

import 'components/Dashboard/ManageUsersPage/AddUserPage.css';

class AddUserPage extends Component {
  state = {
    redirect: false,
    showModal: false,
    userAdded: false,
    emailSent: false,
    errorMessage: null,
  };

  componentDidCatch(err) {
    logError(err);
    this.setState({ errorMessage: err.message });
  }

  addUser = user => {
    this.setState({ showModal: true, errorMessage: null });
    const password = generator.generate({
      length: 30,
      numbers: true,
      symbols: true,
      strict: true,
    });
    this.props
      .addUserMutation({
        variables: {
          email: user.email,
          firstName: user.firstName,
          lastName: user.lastName,
          role: user.role,
          communityId: user.communityId,
          jobTitle: user.jobTitle,
          phoneNumber: user.phoneNumber,
          password: password,
        },
        refetchQueries: ['searchUsers']
      })
      .then(({ data }) => {
        this.setState({ userAdded: true });
        this.sendEmail(user);
      })
      .catch(err => {
        logError(err);
        let errMessage = err.message;
        if (err.message === `GraphQL error: duplicate key value violates unique constraint "user_account_email_key"`) {
          errMessage = "An account with that email address already exists.";
        } else if (err.message === `GraphQL error: new row for relation "user_account" violates check constraint "user_account_email_check"`) {
          errMessage = "The email address entered is invalid. Please update with a valid email address to continue.";
        }
        this.setState({ errorMessage: errMessage });
      });
  };

  sendEmail = user => {
    fetch(`${process.env.REACT_APP_BACKEND_URL}/email/reset`, {
      method: 'POST',
      body: JSON.stringify({ email: user.email }),
      headers: new Headers({
        'Content-Type': 'application/json',
      }),
    })
      .then(res => {
        if (res.status === 204) {
          this.setState({
            emailSent: true,
          });
        } else if (res.status === 400 || res.status === 500) {
          logError(res.errorMessage);
          this.setState({
            emailSent: false,
            errorMessage: 'Email failed to send',
          });
        }
      })
      .catch(err => {
        logError(err);
        this.setState({
          emailSent: false,
          errorMessage: err.message,
        });
      });
  };

  render() {
    const { currentUser } = this.props;
    const { showModal, userAdded, emailSent, errorMessage } = this.state;

    const redirect =
      this.state.redirect || (userAdded && emailSent && !showModal);

    if (redirect) {
      return <Redirect
        push
        to={{
          pathname: '/dashboard/users',
          state: { referrer: this.props.location}
        }} />;
    }

    return (
      <div className="AddUser">
        {showModal && (
          <ActivateUserModal
            onClose={() => this.setState({ showModal: false })}
            userIsNew
            userActivated={userAdded}
            emailSent={emailSent}
            errorMessage={errorMessage}
          />
        )}
        <h1>Add New User</h1>
        <EditUser
          onCancel={() => this.setState({ redirect: true })}
          onSubmit={this.addUser}
          currentUser={currentUser}
        />
      </div>
    );
  }
}

const addUserMutation = gql`
  mutation(
    $firstName: String!
    $lastName: String!
    $jobTitle: String!
    $communityId: Int!
    $phoneNumber: String!
    $email: String!
    $password: String!
    $role: String!
  ) {
    registerUser(
      input: {
        firstName: $firstName
        lastName: $lastName
        jobTitle: $jobTitle
        communityId: $communityId
        phoneNumber: $phoneNumber
        email: $email
        password: $password
        role: $role
      }
    ) {
      user {
        id
      }
    }
  }
`;

export default graphql(addUserMutation, {
  name: 'addUserMutation',
})(AddUserPage);
