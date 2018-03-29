import React from 'react';
import PropTypes from 'prop-types';

import AddLightSvg from 'images/add-light.svg';

import './CommunityTag.css';

export default function CommunityTag({
  community,
  onClick,
}) {
  return (
    <button
      className="CrossingDetails__community-tag--add"
      onClick={() => onClick(community)}
    >
      Add Community
      <img
        src={AddLightSvg}
        className="CrossingDetails__community-tag-icon"
        alt="Remove community"
      />
    </button>
  );
}

CommunityTag.propTypes = {
  community: PropTypes.object.isRequired,
  onClick: PropTypes.func.isRequired,
};
