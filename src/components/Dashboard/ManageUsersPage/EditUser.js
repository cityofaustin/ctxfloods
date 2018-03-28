import React, { Component } from 'react';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';
import 'components/Dashboard/ManageUsersPage/EditUser.css';
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


class EditUser extends Component {
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

  roleChanged = e => {
    this.setState({ role: e.target.value });
  }

  render() {
    // const {communities, roles} = this.props;

    const communities = [1, 2];
    const roles = [1, 2];

    const {firstName, lastName, jobTitle, communityId, phoneNumber, email, role} = this.state;

    return (
        <div className="EditUser">
          <EditUserControl label="Email" isRequired>
            <input
              className="EditUser__control-text-box"
              type="text"
              value={email}
              onChange={this.emailChanged}
            />
          </EditUserControl>
          <div className="EditUser__name">
            <EditUserControl label="First name" isRequired>
              <input
                className="EditUser__control-text-box"
                type="text"
                value={firstName}
                onChange={this.firstNameChanged}
              />
            </EditUserControl>
            <EditUserControl label="Last name" isRequired>
              <input
                className="EditUser__control-text-box"
                type="text"
                value={lastName}
                onChange={this.lastNameChanged}
              />
            </EditUserControl>
          </div>
          <EditUserControl label="Select a role" isRequired>
            <form>
              <div className="EditUser__control-radio-button">
                <label>
                  <input type="radio" value="floods_community_editor" 
                                checked={role === 'floods_community_editor'} 
                                onChange={this.roleChanged} />
                  Contributor | Update, edit, and add crossings in their communities
                </label>
              </div>
              <div className="EditUser__control-radio-button">
                <label>
                  <input type="radio" value="floods_community_admin" 
                                checked={role === 'floods_community_admin'} 
                                onChange={this.roleChanged} />
                  Admin | Update, edit, and add crossings in their communities, and add and delete users in their communities
                </label>
              </div>
              <div className="EditUser__control-radio-button">
                <label>
                  <input type="radio" value="floods_super_admin" 
                                checked={role === 'floods_super_admin'} 
                                onChange={this.roleChanged} />
                  Owner | Take all actions in all communities
                </label>
              </div>
            </form>
          </EditUserControl>
          <EditUserControl label="Community" isRequired>
            <Dropdown
              options={communities}
              selected={communityId}
              onChange={this.communityChanged}
            />
          </EditUserControl>
          <EditUserControl label="Job Title">
            <input
              className="EditUser__control-text-box"
              type="text"
              value={jobTitle}
              onChange={this.jobTitleChanged}
            />
          </EditUserControl>
          <EditUserControl label="Phone (visible to other Dashboard users)">
            <input
              className="EditUser__control-text-box"
              type="text"
              value={phoneNumber}
              onChange={this.phoneNumberChanged}
            />
          </EditUserControl>
      </div>
    );
  }
}

export default EditUser;
