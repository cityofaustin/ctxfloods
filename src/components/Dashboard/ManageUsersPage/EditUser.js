import React, { Component } from 'react';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';
import 'components/Dashboard/ManageUsersPage/EditUser.css';
import EditUserControl from 'components/Dashboard/ManageUsersPage/EditUserControl';

import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

class EditUser extends Component {
  state = {
    email: '',
    firstName: '',
    lastName: '',
    role: 'floods_community_editor',
    communityId: 9009,
    jobTitle: '',
    phoneNumber: '',
  }

  emailChanged = e => {
    this.setState({ email: e.target.value });
  }

  firstNameChanged = e => {
    this.setState({ firstName: e.target.value });
  }

  lastNameChanged = e => {
    this.setState({ lastName: e.target.value });
  }

  roleChanged = e => {
    this.setState({ role: e.target.value });
  }

  communityChanged = e => {
    this.setState({ communityId: e.target.value });
  }

  jobTitleChanged = e => {
    this.setState({ jobTitle: e.target.value });
  }

  phoneNumberChanged = e => {
    this.setState({ phoneNumber: e.target.value });
  }

  submitUser = () => {
    const { onSubmit } = this.props;
    const { email, firstName, lastName, role, communityId, jobTitle, phoneNumber } = this.state;

    const user = {
      email: email,
      firstName: firstName,
      lastName: lastName,
      role: role,
      communityId: communityId,
      jobTitle: jobTitle,
      phoneNumber: phoneNumber,
    }

    onSubmit(user);
  }

  render() {
    const isLoading = !this.props.data || this.props.data.loading;
    if (isLoading) {
      return 'Loading';
    }


    const communities = this.props.data.allCommunities.nodes;

    const { onCancel } = this.props;
    const { email, firstName, lastName, role, communityId, jobTitle, phoneNumber } = this.state;
    const readyToSubmit = firstName && lastName && email;

    return (
        <div className="EditUser">
          <EditUserControl label="Email" isRequired>
            <input
              className="EditUser__control-text-box"
              type="email"
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
          <div className="EditUser__buttons">
            <ButtonSecondary
              className="EditUser__cancel-button"
              onClick={onCancel}
            >
              Cancel
            </ButtonSecondary>
            <ButtonPrimary
              className="EditUser__next-button"
              onClick={this.submitUser}
              disabled={!readyToSubmit}
            >
              Next
            </ButtonPrimary>
          </div>
      </div>
    );
  }
}

const allCommunities = gql`
  query {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`;

export default graphql(allCommunities)(EditUser);
