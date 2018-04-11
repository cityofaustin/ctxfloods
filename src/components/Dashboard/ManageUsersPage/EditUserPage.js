import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
import { Redirect } from 'react-router-dom';

import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';

class EditUserPage extends Component {
  state = {
    redirect: false,
  }

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  editUser = user => {
    this.props
      .editUserMutation({
        variables: {
          userId: this.props.match.params.id,
          firstName: user.firstName,
          lastName: user.lastName,
          jobTitle: user.jobTitle,
          phoneNumber: user.phoneNumber,
        },
      })
      .then(({ data }) => {
        console.log('success', data);
        this.setState({ redirect: true });
      })
      .catch(error => {
        console.log('there was an error sending the query', error);
      });
  };

  render() {
    if (this.state.redirect) {
      return <Redirect to="/dashboard/users" push />;
    }

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
          onCancel={() => this.setState({redirect: true})}
          onSubmit={this.editUser}
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
  mutation($userId:Int!,
           $lastName:String!,
           $firstName:String!,
           $jobTitle:String!,
           $phoneNumber:String!) 
  {
    editUser(input: { userId: $userId,
                      lastName: $lastName,
                      firstName: $firstName,
                      jobTitle: $jobTitle,
                      phoneNumber: $phoneNumber })
    {
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
