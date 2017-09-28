import React from 'react';
import { storiesOf } from '@storybook/react';
import StatusToggle from '../Dashboard/CrossingListPage/CrossingListItem/StatusToggle'

storiesOf('Crossing List Item Status Toggle', module)
  .add('Open', () => <StatusToggle status='open'/>)
  .add('Caution', () => <StatusToggle status='caution'/>)
  .add('Closed', () => <StatusToggle status='closed'/>)
  .add('Long Term Closure', () => <StatusToggle status='longterm'/>)
