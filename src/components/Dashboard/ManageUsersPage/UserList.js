import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';

import Table from 'components/Dashboard/Table/Table';
import ArchiveUserModal from 'components/Dashboard/ManageUsersPage/ArchiveUserModal';
import userActiveFragment from 'components/Dashboard/ManageUsersPage/queries/userActiveFragment';

const manageUsersHeaders = [
  {
    title: '',
    type: 'checkbox_select',
  },
  {
    title: 'Name'
  },
  {
    title: 'Role'
  },
  {
    title: 'Community'
  },
  {
    title: 'Active'
  },
];

class UserList extends Component {
  state = {
    archiveModalOpen: null,
  }

  parseRole(role) {
    const roleArray = role.split('_');
    roleArray.splice(0, 1);

    return roleArray
      .map(word => {
        return word.charAt(0).toUpperCase() + word.substr(1);
      })
      .join(' ');
  }

  render() {
    const isLoading = !this.props.data || this.props.data.loading;

    if (isLoading) {
      return <div>Loading</div>;
    }

    const { searchUsers } = this.props.data;

    if (searchUsers == null) {
      // TODO: add error logging
      return <div>Error Loading Users</div>;
    }

    const userData = searchUsers.nodes.map(user => {
      return [
        {
          isLinked: true,
          link: `/dashboard/user/${user.id}`,
          content: `${user.firstName} ${user.lastName}`,
        },
        this.parseRole(user.role),
        user.communityByCommunityId.name,
        <div>
          <input type="checkbox" checked={user.active} onChange={() => this.setState({archiveModalOpen: user.id})}/>
          {this.state.archiveModalOpen === user.id && (
            <ArchiveUserModal
              user={user}
              onClose={() => {
                this.setState({
                  archiveModalOpen: null,
                });
              }}
            />
          )}
        </div>,
      ];
    });

    return (
      <Table
        data={userData}
        headers={manageUsersHeaders}
        checkboxColumn={true}
      />
    );
  }
}

const searchUsers = gql`
  query searchUsers($searchString: String, $community: Int) {
    searchUsers(search: $searchString, community: $community) {
      nodes {
        id
        ...userActive
        firstName
        lastName
        role
        communityByCommunityId {
          id
          name
        }
      }
    }
  }
  ${userActiveFragment}
`;

export default compose(
  graphql(searchUsers, {
    options: ownProps => ({
      variables: {
        searchString: ownProps.searchParam === '' ? null : ownProps.searchParam,
        community:
          ownProps.currentUser.role === 'floods_super_admin'
            ? null
            : ownProps.currentUser.communityId,
      },
    }),
  }),
)(UserList);
