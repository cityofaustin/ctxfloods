import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
import generator from 'generate-password';

import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';

class EditUserPage extends Component {
  state = {
    errorMessage: null,
  };

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  render() {
    const { currentUser } = this.props;

    const isLoading =
      !this.props.UserByIdQuery ||
      this.props.UserByIdQuery.loading;

    if (isLoading) {
      return <div>Loading</div>;
    }

    const user = this.props.UserByIdQuery.userById;

    return (
      <div className="EditUserPage">
        <h1>Edit User - {user.firstName} {user.lastName}</h1>
        <EditUser
          onCancel={this.redirectToUsers}
          onSubmit={this.addUser}
          currentUser={currentUser}
          userToEdit={user}
        />
      </div>
    );
  }
}

const UserByIdQuery = gql`
  query userById($userId:Int!) {
    userById(id:$userId) {
      id
      emailAddress
      firstName
      lastName
      jobTitle
      phoneNumber
    }
  }
`;

const editUserMutation = gql`
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

export default compose(
  graphql(UserByIdQuery, {
    name: 'UserByIdQuery',
    options: ownProps => ({
      variables: {
        userId: ownProps.match.params.id,
      },
    }),
  }),
  graphql(editUserMutation, {
    name: 'editUserMutation',
  }),
)(EditUserPage);
