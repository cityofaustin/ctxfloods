import React, { Component } from 'react';
import 'components/Dashboard/ManageUsersPage/AddUserPage.css';
import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';
import { Redirect } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import generator from 'generate-password';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';

class AddUserPage extends Component {
  state = {
    redirect: false,
    errorMessage: null,
  }

  redirectToUsers = () => {
    this.setState({redirect: true});
  }

  addUser = user => {
    debugger;
    const password = generator.generate({length: 30, numbers: true, symbols: true, strict:true});
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
        const { id } = data.registerUser.user;
        // this.setState({ redirectToNewCrossingId: id });
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
        this.setState({ errorMessage: error.message });
      });


  }

  render() {
    const { redirect, errorMessage } = this.state;

    if (redirect) {
      return <Redirect to='/dashboard/users' push />
    }

    if (errorMessage) {
      return <ModalErrorMessage>{errorMessage}</ModalErrorMessage>
    }

    return (
      <div className="AddUser">
        <h1>Add New User</h1>
        <EditUser onCancel={this.redirectToUsers} onSubmit={this.addUser}/>
      </div>
    );
  }
}

const addUserMutation = gql`
  mutation ($firstName: String!, $lastName: String!, $jobTitle: String!, $communityId: Int!, $phoneNumber: String!, $email: String!, $password: String!, $role: String!) {
    registerUser(input: {firstName: $firstName, lastName: $lastName, jobTitle: $jobTitle, communityId: $communityId, phoneNumber: $phoneNumber, email: $email, password: $password, role: $role}) {
      user {
        id
      }
    }
  }
`;

export default graphql(addUserMutation, {
  name: 'addUserMutation',
})(AddUserPage);
