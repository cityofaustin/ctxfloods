import React from 'react';
import PropTypes from 'prop-types';

import CloseDarkSvg from 'images/close-dark.svg';

import './CommunityTag.css';

export default function CommunityTag({
  community,
  isRemovable,
  removeCommunity,
}) {
  return (
    <button
      key={community.id}
      className="CrossingDetails__community-tag"
      onClick={() => removeCommunity(community)}
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
  );
}

CommunityTag.propTypes = {
  community: PropTypes.object.isRequired,
  isRemovable: PropTypes.bool.isRequired,
  removeCommunity: PropTypes.func.isRequired,
};
