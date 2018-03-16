import React from 'react';
import { storiesOf } from '@storybook/react';

import StatusToggle from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/StatusToggle';
import * as statusConstants from 'constants/StatusConstants';

const clickProps = {
  toggleOpen: function() {},
  toggleCaution: function() {},
  toggleClosed: function() {},
  toggleLongterm: function() {},
};

storiesOf('Crossing List Item Status Toggle', module)
  .add('Open', () => (
    <StatusToggle status={statusConstants.OPEN} {...clickProps} />
  ))
  .add('Caution', () => (
    <StatusToggle status={statusConstants.CAUTION} {...clickProps} />
  ))
  .add('Closed', () => (
    <StatusToggle status={statusConstants.CLOSED} {...clickProps} />
  ))
  .add('Long Term Closure', () => (
    <StatusToggle status={statusConstants.LONGTERM} {...clickProps} />
  ));
