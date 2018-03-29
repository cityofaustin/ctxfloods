import React, { Component } from 'react';
import 'components/Dashboard/ManageUsersPage/AddUserPage.css';
import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';

class AddUserPage extends Component {
  render() {
    return (
      <div className="AddUser">
        <h1>Add New User</h1>
        <EditUser />
      </div>
    );
  }
}

export default AddUserPage;
