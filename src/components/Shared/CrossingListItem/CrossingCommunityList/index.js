import React from 'react';
import { Link } from 'react-router-dom';

import './CrossingCommunityList.css';

export default function CrossingCommunityList({ crossing, allCommunities }) {
  return (
    <div
      className="CrossingCommunityList"
      onClick={e => {
        // Don't fire CrossingSidebarNearbyCrossingItem onClick
        e.stopPropagation();
      }}
    >
      {crossing.communityIds.map(communityId => {
        const community = allCommunities.find(c => c.id === communityId);
        return community && ( 
          <Link to={`/map/community/${community.id}`} key={community.id}>
            {community.name}
          </Link>
        )
      })}
    </div>
  );
}
