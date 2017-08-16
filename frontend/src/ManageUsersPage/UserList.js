import React from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import Table from './Table';

const manageUsersHeaders = [{
  title: '',
  type: 'checkbox_select',
}, {
  title: 'Name',
  canFilter: true,
  canSort: true,
}, {
  title: 'Role',
  canFilter: true,
  canSort: true,
}, {
  title: 'Community',
  canFilter: true,
  canSort: true,
}, {
  title: 'Last active',
  canFilter: true,
  canSort: true,
}];


class UserList extends React.Component {
  parseRole(role) {
    return role.split("_").map((word) => {
      return (word.charAt(0).toUpperCase() + word.substr(1));
    }).join(' ');
  }

  render () {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }

    if (this.props.data.allUsers == null) {
      // TODO: add error logging
      return (<div>Error Loading Users</div>);
    }

    const userData = this.props.data.allUsers.nodes.map((user) => {
    	return [
        `${user.firstName} ${user.lastName}`,
        this.parseRole(user.role),
        user.communityByCommunityId.name,
        'todo',
      ]
    });

    return (
      <Table data={userData} headers={manageUsersHeaders} checkboxColumn={true} />
    );
  }

}

const allUsers = gql`
  {
    allUsers {
      nodes {
        id
        firstName
        lastName
        role
        communityByCommunityId {
          name
        }
      }
    }
  }
`;

export default graphql(allUsers)(UserList);
