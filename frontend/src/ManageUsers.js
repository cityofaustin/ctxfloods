import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import UserList from './UserList';



class ManageUsers extends Component {

  render() {
    return (
      <div>
        <h1>Manage Users</h1>
        <Link to="/createuser">Add New</Link>

        <UserList {...this.props} />
      </div>
    );
  }

}

export default ManageUsers;
