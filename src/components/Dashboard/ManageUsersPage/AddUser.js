import React, { Component } from 'react';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';
import 'components/Dashboard/ManageUsersPage/AddUser.css';
import EditUserControl from 'components/Dashboard/ManageUsersPage/EditUserControl';

/*

          <label for="email">Email*</label>
          <input
            id="email"
            type="text"
            value={email}
            onChange={this.emailChanged}
          />

*/


class AddUser extends Component {
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

          <EditUserControl label="Email" isRequired>
            <input
              className="EditUser__control-text-box"
              type="text"
              value={email}
              onChange={this.emailChanged}
            />
          </EditUserControl>

          <div>
            <label for="firstName">First Name</label>
            <input
              id="firstName"
              type="text"
              value={firstName}
              onChange={this.firstNameChanged}
            />
            <label for="lastName">Last Name</label>
            <input
              id="lastName"
              type="text"
              value={lastName}
              onChange={this.lastNameChanged}
            />
          </div>
          <label for="jobTitle">Job Title</label>
          <input
            id="jobTitle"
            type="text"
            value={jobTitle}
            onChange={this.jobTitleChanged}
          />
          <Dropdown
            options={communities}
            selected={communityId}
            onChange={this.communityChanged}
          />
          <input
            id="phoneNumber"
            type="text"
            value={phoneNumber}
            onChange={this.phoneNumberChanged}
          />
          <Dropdown
            options={roles}
            selected={role}
            onChange={this.roleChanged}
          />
      </div>
    );
  }
}

export default AddUser;
