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
  }

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  addUser = user => {
    debugger;
    this.setState({showModal: true, errorMessage: null});
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
        this.setState({userAdded: true});
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
        this.setState({ errorMessage: error.message });
      });
  }

  render() {
    const { redirect, showModal, userAdded, emailSent, errorMessage } = this.state;

    if (redirect && !showModal) {
      return <Redirect to='/dashboard/users' push />
    }

    return (
      <div className="AddUser">
        {showModal && 
          <AddUserModal onClose={() => this.setState({showModal: false})} userAdded={userAdded} emailSent={true} errorMessage={errorMessage}/>
        }
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
