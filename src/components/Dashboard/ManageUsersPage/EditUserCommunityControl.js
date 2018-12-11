import React, { Component } from 'react';
import Dropdown from 'components/Shared/Form/Dropdown';

import './EditUserControl.css';
import 'components/Dashboard/ManageUsersPage/EditUser.css';

class EditUserCommunityControl extends Component {

  render() {
    const {
      newCommunity, // Boolean, is new community or not
      newUser, // Boolean, is new user or not
      communities, // Array of Objects, list of existing communities to choose from
      communityId, // Integer, Id of selected existing community
      newCommunityName, // String, user-inputted name of new community
      toggleNewCommunity, // Function, handle change of newCommunity flag
      communityIdChanged, // Function, handle change of CommunityId
      newCommunityNameChanged // Function, handle change of Community Name
    } = this.props;

    const dropdownComponent = (
      <Dropdown
        options={communities}
        selected={communityId}
        onChange={communityIdChanged}
        disabled={!newUser}
      />
    );

    if (!newUser) {
      return dropdownComponent
    }
    return (
      <div>
        <div className="EditUser__control-radio-button">
          <label>
            <input
              type="radio"
              value={false}
              checked={!newCommunity}
              onChange={toggleNewCommunity}
            />
            Choose Existing Community
          </label>
        </div>
        <div className="EditUser__control-radio-button">
          <label>
            <input
              type="radio"
              value={true}
              checked={newCommunity}
              onChange={toggleNewCommunity}
            />
            Add to New Community
          </label>
        </div>
        {(newCommunity) ? (
          <input
            className="EditUser__control-text-box"
            type="text"
            value={newCommunityName}
            onChange={newCommunityNameChanged}
          />
        ) : dropdownComponent}
      </div>
    )
  }
}

export default EditUserCommunityControl;
