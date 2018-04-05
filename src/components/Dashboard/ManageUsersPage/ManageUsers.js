import React, { Component } from 'react';
import MobileDetect from 'mobile-detect';

import LinkButton from 'components/LinkButton';
import TableSearch from 'components/Dashboard/Table/TableSearch';
import UserList from 'components/Dashboard/ManageUsersPage/UserList';
import 'components/Dashboard/ManageUsersPage/ManageUsers.css';

const md = new MobileDetect(window.navigator.userAgent);

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
    if (md.mobile()) {
      return <div>Managing users is not yet supported on mobile.</div>;
    }

    return (
      <div className="ManageUsers">
        <div className="flexcontainer">
          <h1 className="ManageUsers__h1">Manage Users</h1>
          <div className="ManageUsers__right-aligned-element">
            <LinkButton url="/dashboard/user/add" text="Add New" />
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
