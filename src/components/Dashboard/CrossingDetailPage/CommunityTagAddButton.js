import React from 'react';
import PropTypes from 'prop-types';

import AddLightSvg from 'images/add-light.svg';

import './CommunityTag.css';

export default function CommunityTagAddButton({ community, onClick }) {
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

CommunityTagAddButton.propTypes = {
  onClick: PropTypes.func.isRequired,
};
