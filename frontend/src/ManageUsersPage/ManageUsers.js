import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

import Button from '../Button';
import BulkActionsDropdown from './BulkActionsDropdown';
import TableSearch from './TableSearch';
import UserList from './UserList';
import './ManageUsers.css';

class ManageUsers extends Component {
  render() {
    return (
      <div className="ManageUsers">
        <div className="flexcontainer">
          <h1 className="ManageUsers__h1">Manage Users</h1>
          <div className="ManageUsers__button">
            <Button linkTo="/createuser" text="Add New" />
          </div>
        </div>
        <div className="flexcontainer">
          <BulkActionsDropdown />
          <TableSearch />
        </div>
        <UserList {...this.props} />
      </div>
    );
  }

}


export default ManageUsers;
