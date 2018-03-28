import React, { Component } from 'react';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';
import 'components/Dashboard/ManageUsersPage/AddUserPage.css';
import EditUser from 'components/Dashboard/ManageUsersPage/EditUser';

/*

          <label for="email">Email*</label>
          <input
            id="email"
            type="text"
            value={email}
            onChange={this.emailChanged}
          />

*/


class AddUserPage extends Component {
  state = {
    firstName: '',
    lastName: '',
    jobTitle: '',
    phoneNumber: '',
    email: '',
  }

  emailChanged = e => {
    this.setState({ email: e.target.value });
  }

  render() {
    // const {communities, roles} = this.props;

    const communities = [1, 2];
    const roles = [1, 2];

    const {firstName, lastName, jobTitle, communityId, phoneNumber, email, role} = this.state;

    return (
      <div className="AddUser">
        <h1>Add New User</h1>

        <EditUser />
      </div>
    );
  }
}

export default AddUserPage;
