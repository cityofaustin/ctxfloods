import React from 'react';
import { Link } from 'react-router-dom';

import './CrossingCommunityList.css';

export default function CrossingCommunityList({ crossing }) {
  return (
    <div
      className="CrossingCommunityList"
      onClick={e => {
        // Don't fire CrossingSidebarNearbyCrossingItem onClick
        e.stopPropagation();
      }}
    >
      {crossing.communities.nodes.map(community => (
        <Link to={`/map/community/${community.id}`} key={community.id}>
          {community.name}
        </Link>
      ))}
    </div>
  );
}
