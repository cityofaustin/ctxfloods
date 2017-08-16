import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import BulkActionsDropdown from './BulkActionsDropdown';
import TableSearch from './TableSearch';
import UserList from './UserList';
import './ManageUsers.css';

class ManageUsers extends Component {
  render() {
    return (
      <div className="ManageUsers">
        <h1 className="ManageUsers__h1">Manage Users</h1>
        <Link to="/createuser">Add New</Link>
        <BulkActionsDropdown />
        <TableSearch />
        <UserList {...this.props} />
      </div>
    );
  }

}


export default ManageUsers;
