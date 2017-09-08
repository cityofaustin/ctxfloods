import React from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import Table from './Table';

const manageUsersHeaders = [{
  title: '',
  type: 'checkbox_select',
}, {
  title: 'Name',
  isFilterale: true,
  isSortable: true,
}, {
  title: 'Role',
  isFilterale: true,
  isSortable: true,
}, {
  title: 'Community',
  isFilterale: true,
  isSortable: true,
}, {
  title: 'Last active',
  isFilterale: true,
  isSortable: true,
}];

class UserList extends React.Component {
  parseRole(role) {
    const roleArray = role.split("_");
    roleArray.splice(0, 1)

    return roleArray.map((word) => {
      return (word.charAt(0).toUpperCase() + word.substr(1));
    }).join(' ');
  }

  render () {
    console.log('inside UserList', this.props.searchParam)

    if (!this.props.data || this.props.data.loading) {
      return (<div>Loading</div>)
    }

    const { communityUsers, allUsers } = this.props.data;

    // if ((communityUsers == null) && (allUsers == null)) {
    //   // TODO: add error logging
    //   return (<div>Error Loading Users</div>);
    // }

    // const users = this.props.currentUser.role === "floods_super_admin"
    //   ? allUsers
    //   : communityUsers;

    const users = searchUsers;


    const userData = users.nodes.map((user) => {
      console.log(user)
    	return [
        { isLinked: true, link: `/user/${user.id}`, content: `${user.firstName} ${user.lastName}` },
        this.parseRole(user.role),
        user.communityByCommunityId.name,
        '',
      ]
    });

    return (
      <Table data={userData} headers={manageUsersHeaders} checkboxColumn={true} />
    );
  }

}


const getUsers = gql`
  fragment UserData on User {
    id
    firstName
    lastName
    role
    communityByCommunityId {
      id
      name
    }
  }
  query allUsers($superUser: Boolean!, $communityId: Int!) {
    allUsers @include(if: $superUser) {
      nodes {
        ...UserData
      }
    }
    communityUsers: allUsers(condition: {communityId: $communityId}) @skip(if: $superUser) {
      nodes {
        ...UserData
      }
    }
  }
`;

const searchUsers = gql`
  query searchUsers($searchString: String!) {
  searchUsers(search: $searchString) {
    nodes {
      firstName
      lastName
      communityByCommunityId {
        name
      }
    }
  }
}`;

// export default compose(
//   graphql(getUsers, {
//     skip: (ownProps) => !ownProps.currentUser || ownProps.searchParam,
//     options: (ownProps) => ({
//       variables: {
//         communityId: ownProps.currentUser.communityId,
//         superUser: ownProps.currentUser.role === "floods_super_admin"
//       }
//     }),
//   }),
//   graphql(getFilteredUsers, {
//     skip: (ownProps) => !ownProps.searchParam,
//     options: {
//       variables: {
//         searchString: "super"
//       }
//     }
//   })
// )(UserList);

export default graphql(searchUsers, {
  skip: (ownProps) => !ownProps.searchParam,
  options: {
    variables: {
      searchString: "super"
    }
  }
})(UserList);
