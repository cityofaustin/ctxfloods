import React, { Component } from 'react';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';

class AddUser extends Component {
  state = {
    firstName: '',
    lastName: '',
    jobTitle: '',
    phoneNumber: '',
    email: '',
  }

  render() {
    // const {communities, roles} = this.props;

    const communities = [1, 2];
    const roles = [1, 2];

    const {firstName, lastName, jobTitle, communityId, phoneNumber, email, role} = this.state;

    return (
      <div className="AddUser">
        <h1>Add User</h1>
          <input
            id="firstName"
            type="text"
            value={firstName}
            onChange={this.firstNameChanged}
          />
          <input
            id="lastName"
            type="text"
            value={lastName}
            onChange={this.lastNameChanged}
          />
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
          <input
            id="email"
            type="text"
            value={email}
            onChange={this.emailChanged}
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
