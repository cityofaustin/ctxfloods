import React from 'react';
import { Link } from 'react-router-dom';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';

import './CrossingCommunityList.css';

function CrossingCommunityList({ crossingId, loading, error, data }) {
  if (loading || !data.crossingById) return null;
  if (error) {
    console.error(error);
    return null;
  }

  return (
    <div
      className="CrossingCommunityList"
      onClick={e => {
        // Don't fire CrossingSidebarNearbyCrossingItem onClick
        e.stopPropagation();
      }}
    >
      {data.crossingById.communities.nodes.map(community => (
        <Link to={`/map/community/${community.id}`} key={community.id}>
          {community.name}
        </Link>
      ))}
    </div>
  );
}

export default graphql(gql`
  query crossingCommunitiesQuery($crossingId: Int!) {
    crossingById(id: $crossingId) {
      communities {
        nodes {
          id
          name
        }
      }
    }
  }
`)(CrossingCommunityList);
