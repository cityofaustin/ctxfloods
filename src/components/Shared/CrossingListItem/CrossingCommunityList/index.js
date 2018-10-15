import React from 'react';
import { Link } from 'react-router-dom';

import './CrossingCommunityList.css';

export default function CrossingCommunityList({ crossing, allCommunities, onDash }) {
  return (
    <div
      className="CrossingCommunityList"
      onClick={e => {
        // Don't fire CrossingSidebarNearbyCrossingItem onClick
        e.stopPropagation();
      }}
    >
      {crossing.communityIds.map(communityId => {
        if (!allCommunities) {
          return null;
        }
        const community = allCommunities.find(c => c.id === communityId);
        return (
          community && (
            <Link to={`${onDash ? '/dashboard' : ''}/map/community/${community.id}`} key={community.id}>
              <span className="CrossingCommunityList__item">
                {community.name}
              </span>
            </Link>
          )
        );
      })}
    </div>
  );
}
