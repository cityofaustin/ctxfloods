import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
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

  addUserFactory = (withNewCommunity) => (params) => {
    this.setState({ showModal: true, errorMessage: null });
    const password = generator.generate({
      length: 30,
      numbers: true,
      symbols: true,
      strict: true,
    });

    let mutation, variables = {
      email: params.email,
      firstName: params.firstName,
      lastName: params.lastName,
      role: params.role,
      jobTitle: params.jobTitle,
      phoneNumber: params.phoneNumber,
      password: password,
    };

    if (withNewCommunity) {
      mutation = this.props.addUserWithNewCommunityMutation;
      variables.communityName = params.communityName;
    } else {
      mutation = this.props.addUserMutation;
      variables.communityId = Number(params.communityId);
    }

    mutation({
      variables,
      refetchQueries: ['searchUsers', 'allCommunities']
    })
    .then(({ data }) => {
      this.setState({ userAdded: true });
      this.sendEmail(params);
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

  addUser = this.addUserFactory(false);
  addUserWithNewCommunity = this.addUserFactory(true);

  sendEmail = user => {
    fetch(`${process.env.REACT_APP_BACKEND_URL}/email/reset`, {
      method: 'POST',
      body: JSON.stringify({ email: user.email, newUser: true }),
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
          addUserWithNewCommunity={this.addUserWithNewCommunity}
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

const addUserWithNewCommunityMutation = gql`
  mutation(
    $firstName: String!
    $lastName: String!
    $jobTitle: String!
    $phoneNumber: String!
    $email: String!
    $password: String!
    $role: String!
    $communityName: String!
  ) {
    registerUserWithNewCommunity(
      input: {
        firstName: $firstName
        lastName: $lastName
        jobTitle: $jobTitle
        phoneNumber: $phoneNumber
        email: $email
        password: $password
        role: $role
        communityName: $communityName
      }
    ) {
      user {
        id
      }
    }
  }
`;

export default compose(
  graphql(addUserMutation, {
    name: 'addUserMutation',
  }),
  graphql(addUserWithNewCommunityMutation, {
    name: 'addUserWithNewCommunityMutation'
  })
)(AddUserPage);
