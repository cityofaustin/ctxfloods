import React, { Component } from 'react';
import 'components/Dashboard/ManageUsersPage/AddUserPage.css';
import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';
import { Redirect } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import generator from 'generate-password';
import AddUserModal from 'components/Dashboard/ManageUsersPage/AddUserModal';

class AddUserPage extends Component {
  state = {
    redirect: false,
    showModal: false,
    userAdded: false,
    emailSent: false,
    errorMessage: null,
  };

  componentDidCatch(err) {
    console.error(err);
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
      })
      .then(({ data }) => {
        console.log('success', data);
        this.setState({ userAdded: true });
        this.sendEmail(user);
      })
      .catch(error => {
        console.log('there was an error sending the query', error);
        this.setState({ errorMessage: error.message });
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
        } else if (res.status === 400) {
          this.setState({
            emailSent: false,
            errorMessage: 'Email failed to send',
          });
        }
      })
      .catch(error => {
        console.error(error);
        this.setState({
          emailSent: false,
          errorMessage: error.message,
        });
      });
  };

  render() {
    const { currentUser } = this.props;
    const { showModal, userAdded, emailSent, errorMessage } = this.state;

    if (userAdded && emailSent && !showModal) {
      return <Redirect to="/dashboard/users" push />;
    }

    return (
      <div className="AddUser">
        {showModal && (
          <AddUserModal
            onClose={() => this.setState({ showModal: false })}
            userAdded={userAdded}
            emailSent={emailSent}
            errorMessage={errorMessage}
          />
        )}
        <h1>Add New User</h1>
        <EditUser
          onCancel={this.redirectToUsers}
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
