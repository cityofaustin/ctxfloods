import React from 'react';
import { storiesOf } from '@storybook/react';
import StatusToggle from '../Dashboard/CrossingListPage/StatusToggle'

storiesOf('Toggle Crossing Status', module)
  .add('Toggle Crossing Status', () => <StatusToggle />);
