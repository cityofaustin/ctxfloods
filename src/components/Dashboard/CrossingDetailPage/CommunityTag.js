import React, { Component, Fragment } from 'react';
import PropTypes from 'prop-types';

import CommunityRemoveModal from './CommunityRemoveModal';

import CloseDarkSvg from 'images/close-dark.svg';
import './CommunityTag.css';

export default class CommunityTag extends Component {
  static propTypes = {
    community: PropTypes.object.isRequired,
    crossing: PropTypes.object.isRequired,
    isRemovable: PropTypes.bool.isRequired,
    onCommunityRemoved: PropTypes.func.isRequired,
  };

  constructor(...args) {
    super(...args);
    this.state = {
      isOpen: false,
    };
  }

  render() {
    const { community, isRemovable, crossing, onCommunityRemoved } = this.props;
    return (
      <Fragment>
        <button
          className="CrossingDetails__community-tag"
          onClick={() => {
            this.setState({
              isOpen: true,
            });
          }}
          disabled={!isRemovable}
        >
          {community.name}
          {isRemovable && (
            <img
              src={CloseDarkSvg}
              className="CrossingDetails__community-tag-icon"
              alt="Remove community"
            />
          )}
        </button>
        {this.state.isOpen && (
          <CommunityRemoveModal
            crossing={crossing}
            community={community}
            onClose={() => {
              this.setState({
                isOpen: false,
              });
            }}
            onCommunityRemoved={onCommunityRemoved}
          />
        )}
      </Fragment>
    );
  }
}
