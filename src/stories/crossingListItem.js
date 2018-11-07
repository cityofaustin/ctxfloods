import React from 'react';
import { storiesOf } from '@storybook/react';
import { MemoryRouter } from 'react-router';

import CrossingListItem from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/DashboardCrossingListItem';

const reasons = [
  { id: 1, name: 'Flooded', statusId: 2 },
  { id: 2, name: 'Bridge Broken', statusId: 2 },
  { id: 1, name: 'Flooded', statusId: 3 },
  { id: 2, name: 'Bridge Broken', statusId: 3 },
  { id: 1, name: 'Flooded', statusId: 4 },
  { id: 2, name: 'Bridge Broken', statusId: 4 },
];

const communities = [
  {
    id: 1234,
    name: 'All of Texas.',
  },
];

const openCrossing = {
  id: 1,
  name: 'Spurlock Valley',
  description: 'E of Intersection w/ Clifford',
  humanAddress: '605 Spurlock Valley \u00b7 West Lake Hills, TX 78746',
  statusUpdateByLatestStatusUpdateId: {
    statusId: 1,
    createdAt: '2017-10-10T04:35:37.306767',
    notes: 'All Clear',
    userByCreatorId: {
      firstName: 'Super',
      lastName: 'Admin',
    },
  },
  communityIds: [1234],
};

const closedCrossing = {
  id: 1,
  name: 'Spurlock Valley',
  description: 'E of Intersection w/ Clifford',
  humanAddress: '605 Spurlock Valley \u00b7 West Lake Hills, TX 78746',
  statusUpdateByLatestStatusUpdateId: {
    statusId: 2,
    statusReasonId: 1,
    createdAt: '2017-10-10T04:35:37.306767',
    notes: 'No Go',
    userByCreatorId: {
      firstName: 'Super',
      lastName: 'Admin',
    },
  },
  communityIds: [1234],
};

const cautionCrossing = {
  id: 1,
  name: 'Spurlock Valley',
  description: 'E of Intersection w/ Clifford',
  humanAddress: '605 Spurlock Valley \u00b7 West Lake Hills, TX 78746',
  statusUpdateByLatestStatusUpdateId: {
    statusId: 3,
    statusReasonId: 1,
    createdAt: '2017-10-10T04:35:37.306767',
    notes: 'Watch Out',
    userByCreatorId: {
      firstName: 'Super',
      lastName: 'Admin',
    },
  },
  communityIds: [1234],
};

// const longtermCrossing = {
//   id: 1,
//   name: 'Spurlock Valley',
//   description: 'E of Intersection w/ Clifford',
//   humanAddress: '605 Spurlock Valley \u00b7 West Lake Hills, TX 78746',
//   statusUpdateByLatestStatusUpdateId: {
//     statusId: 4,
//     statusReasonId: 2,
//     reopenDate: '2020-11-18',
//     indefiniteClosure: false,
//     createdAt: '2017-10-10T04:35:37.306767',
//     notes: 'Gonna be a while',
//     userByCreatorId: {
//       firstName: 'Super',
//       lastName: 'Admin',
//     },
//   },
//   communityIds: [1234],
// };

storiesOf('Crossing List Item', module)
  .add('Open', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={openCrossing}
        allCommunities={communities}
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  .add('Open Dirty', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={openCrossing}
        allCommunities={communities}
        dirty="true"
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  .add('Caution', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={cautionCrossing}
        allCommunities={communities}
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  .add('Caution Dirty', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={cautionCrossing}
        allCommunities={communities}
        dirty="true"
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  .add('Closed', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={closedCrossing}
        allCommunities={communities}
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  .add('Closed Dirty', () => (
    <MemoryRouter>
      <CrossingListItem
        reasons={reasons}
        crossing={closedCrossing}
        allCommunities={communities}
        dirty="true"
        restoreDirtyState={() => null}
        saveDirtyState={() => null}
      />
    </MemoryRouter>
  ))
  // TODO: fix these storyshots. Throws errors from flatpickr (this.flatpickr.setDate is not a function).
  //       Errors are only thrown in test suite.
  // .add('Long-Term Closure', () => (
  //   <MemoryRouter>
  //     <CrossingListItem
  //       reasons={reasons}
  //       crossing={longtermCrossing}
  //       allCommunities={communities}
  //       restoreDirtyState={() => null}
  //       saveDirtyState={() => null}
  //     />
  //   </MemoryRouter>
  // ))
  // .add('Long-Term Closure Dirty', () => (
  //   <MemoryRouter>
  //     <CrossingListItem
  //       reasons={reasons}
  //       crossing={longtermCrossing}
  //       allCommunities={communities}
  //       dirty="true"
  //       restoreDirtyState={() => null}
  //       saveDirtyState={() => null}
  //     />
  //   </MemoryRouter>
  // ))
  .add('Large Width', () => (
    <MemoryRouter>
      <div className="storybook--lg">
        <CrossingListItem
          reasons={reasons}
          crossing={closedCrossing}
          allCommunities={communities}
          restoreDirtyState={() => null}
          saveDirtyState={() => null}
        />
      </div>
    </MemoryRouter>
  ))
  .add('Small Width', () => (
    <MemoryRouter>
      <div className="storybook--sm">
        <CrossingListItem
          reasons={reasons}
          crossing={closedCrossing}
          allCommunities={communities}
          restoreDirtyState={() => null}
          saveDirtyState={() => null}
        />
      </div>
    </MemoryRouter>
  ));
