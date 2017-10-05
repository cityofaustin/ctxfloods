import React from 'react';
import { storiesOf } from '@storybook/react';
import CrossingListItem from '../Dashboard/CrossingListPage/CrossingListItem/CrossingListItem'
import * as statusConstants from '../Dashboard/CrossingListPage/CrossingListItem/StatusConstants'

storiesOf('Crossing List Item', module)
  .add('Open', () => <CrossingListItem savedStatus={statusConstants.OPEN}/>)
  .add('Open Dirty', () => <CrossingListItem status={statusConstants.OPEN} dirty="true"/>)
  .add('Caution', () => <CrossingListItem status={statusConstants.CAUTION}/>)
  .add('Caution Dirty', () => <CrossingListItem status={statusConstants.CAUTION} dirty="true"/>)
  .add('Closed', () => <CrossingListItem status={statusConstants.CLOSED}/>)
  .add('Closed Dirty', () => <CrossingListItem status={statusConstants.CLOSED} dirty="true"/>)
  .add('Long Term Closure', () => <CrossingListItem status={statusConstants.LONGTERM}/>)
  .add('Long Term Closure Dirty', () => <CrossingListItem status={statusConstants.LONGTERM} dirty="true"/>)
