import React, { Component } from 'react';
import CommunityListDropdown from 'components/Shared/CommunityListDropdown';

export default class CommunityListDropdownButton extends Component {
  state = {
    isOpen: false,
  };

  render() {
    return (
      <li className="Header__tab">
        {this.state.isOpen && (
          <CommunityListDropdown
            closeDropdown={() => this.setState({ isOpen: false })}
            location = {this.props.location}
          />
        )}
        <div
          className="CommunityListDropdownButton"
          onClick={() => {
            this.setState({ isOpen: !this.state.isOpen });
          }}
        >
          Communities
        </div>
      </li>
    );
  }
}
