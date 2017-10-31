import React from 'react';
import { storiesOf } from '@storybook/react';
import CrossingStatusHistory from '../Dashboard/CrossingDetailPage/CrossingStatusHistory'
import * as statusConstants from '../constants/StatusConstants'

const history = [
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 2,
    "name": "Closed"
  },
  "statusReasonByStatusReasonId": {
    "name": "Flooded"
  },
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-06-04T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 1,
    "name": "Open"
  },
  "statusReasonByStatusReasonId": null,
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-28T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 2,
    "name": "Closed"
  },
  "statusReasonByStatusReasonId": {
    "name": "Flooded"
  },
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-25T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 1,
    "name": "Open"
  },
  "statusReasonByStatusReasonId": null,
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-20T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 1,
    "name": "Open"
  },
  "statusReasonByStatusReasonId": null,
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-19T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 2,
    "name": "Closed"
  },
  "statusReasonByStatusReasonId": {
    "name": "Flooded"
  },
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-17T09:27:57",
  "notes": "notes"
},
{
  "userByCreatorId": {
    "id": 1,
    "lastName": "Admin",
    "firstName": "Super"
  },
  "statusByStatusId": {
    "id": 1,
    "name": "Open"
  },
  "statusReasonByStatusReasonId": null,
  "statusDurationByStatusDurationId": null,
  "createdAt": "2017-05-11T09:27:57",
  "notes": "notes"
}];

storiesOf('Crossing Status History', module)
  .add('A crossing history', () => <CrossingStatusHistory history={history} />)
  // .add('Caution', () => <CrossingStatusHistory reasons={reasons} durations={durations} crossing={cautionCrossing} />)
  // .add('Closed', () => <CrossingStatusHistory reasons={reasons} durations={durations} crossing={closedCrossing} />)
  // .add('Long Term Closure', () => <CrossingStatusHistory reasons={reasons} durations={durations} crossing={longtermCrossing} />)
  // .add('Width 900px', () =>
  //   <div style={{width: '900px'}}>
  //     <CrossingStatusHistory reasons={reasons} durations={durations} crossing={longtermCrossing} />
  //   </div>)
  // .add('Width 400px', () =>
  //   <div style={{width: '400px'}}>
  //     <CrossingStatusHistory reasons={reasons} durations={durations} crossing={longtermCrossing} />
  //   </div>
  // );
