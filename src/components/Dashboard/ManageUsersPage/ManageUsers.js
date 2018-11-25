import React, { Component } from 'react';

import LinkButton from 'components/Shared/LinkButton';
import TableSearch from 'components/Dashboard/Table/TableSearch';
import UserList from 'components/Dashboard/ManageUsersPage/UserList';
import 'components/Dashboard/ManageUsersPage/ManageUsers.css';

class ManageUsers extends Component {
  constructor(props) {
    super(props);
    this.state = { searchParam: '' };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.setState({ searchParam: e.target.elements.tableSearch.value });
  }

  render() {
    return (
      <div className="ManageUsers">
        <div className="flexcontainer">
          <h1 className="ManageUsers__h1">Manage Users</h1>
          <div className="ManageUsers__right-aligned-element">
            <LinkButton url="/dashboard/users/add" text="Add User" />
          </div>
        </div>
        <div className="flexcontainer">
          <TableSearch handleSubmit={this.handleSubmit} />
        </div>
        <UserList {...this.props} searchParam={this.state.searchParam} />
      </div>
    );
  }
}

export default ManageUsers;
