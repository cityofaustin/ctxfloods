import React from 'react';
import { storiesOf } from '@storybook/react';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';

const crossing = {
  "id": 1,
  "name": "Spurlock Valley",
  "description": "E of Intersection w\/ Clifford",
  "humanAddress": "605 Spurlock Valley \u00b7 West Lake Hills, TX 78746",
  "geojson":"{\"type\":\"Point\",\"coordinates\":[-97.768,30.267]}",
  "humanAddress":"at city hall",
  "humanCoordinates":"30°16'1.200\"N 97°46'4.800\"W",
  "communityCrossingsByCrossingId": {
    "nodes": [
      {
        "communityByCommunityId": {
          "id": 1,
          "name": "All of Texas."
        },
      }
    ],
  }
};

const communities = crossing.communityCrossingsByCrossingId.nodes.map(n => n.communityByCommunityId);

storiesOf('Crossing Details', module)
  .add('Crossing', () => 
    <CrossingDetails crossing={crossing} communities={communities}/>
  );