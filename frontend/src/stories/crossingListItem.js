import React from 'react';
import { storiesOf } from '@storybook/react';
import CrossingListItem from '../Dashboard/CrossingListPage/CrossingListItem/CrossingListItem'

storiesOf('Crossing List Item', module)
  .add('Open', () => <CrossingListItem status='open'/>)
  .add('Open Dirty', () => <CrossingListItem status='open' dirty="true"/>)
  .add('Caution', () => <CrossingListItem status='caution'/>)
  .add('Caution Dirty', () => <CrossingListItem status='caution' dirty="true"/>)
  .add('Closed', () => <CrossingListItem status='closed'/>)
  .add('Closed Dirty', () => <CrossingListItem status='closed' dirty="true"/>)
  .add('Long Term Closure', () => <CrossingListItem status='longterm'/>)
  .add('Long Term Closure Dirty', () => <CrossingListItem status='longterm' dirty="true"/>)
