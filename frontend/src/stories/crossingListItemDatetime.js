import React from 'react';
import { storiesOf } from '@storybook/react';
import DateTime from '../Dashboard/CrossingListPage/CrossingListItem/DateTime'

const crossing = {
  "statusUpdateByLatestStatusId": {
    "statusId": 1,
    "createdAt": "2017-10-10T04:35:37.306767",
    "notes": "All Clear",
    "userByCreatorId": {
      "firstName": "Super",
      "lastName": "Admin",
    },
  }
}

storiesOf('Crossing List Item DateTime', module)
  .add('DateTime', () => <DateTime update={ crossing.statusUpdateByLatestStatusId } />);
