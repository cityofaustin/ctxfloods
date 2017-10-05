import React from 'react';
import { storiesOf } from '@storybook/react';
import StatusToggle from '../Dashboard/CrossingListPage/CrossingListItem/StatusToggle'
import * as statusConstants from '../Dashboard/CrossingListPage/CrossingListItem/StatusConstants'


storiesOf('Crossing List Item Status Toggle', module)
  .add('Open', () => <StatusToggle status={statusConstants.OPEN} />)
  .add('Caution', () => <StatusToggle status={statusConstants.CAUTION} />)
  .add('Closed', () => <StatusToggle status={statusConstants.CLOSED} />)
  .add('Long Term Closure', () => <StatusToggle status={statusConstants.LONGTERM} />)
