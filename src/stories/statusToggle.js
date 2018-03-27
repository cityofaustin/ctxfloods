import React from 'react';
import { storiesOf } from '@storybook/react';

import StatusToggle from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/StatusToggle';
import * as statusConstants from 'constants/StatusConstants';

const clickProps = {
  activateOpenToggle: function() {},
  activateCautionToggle: function() {},
  activateClosedToggle: function() {},
  activateLongtermToggle: function() {},
};

storiesOf('Crossing List Item Status Toggle', module)
  .add('Open', () => (
    <StatusToggle activeStatus={statusConstants.OPEN} {...clickProps} />
  ))
  .add('Caution', () => (
    <StatusToggle activeStatus={statusConstants.CAUTION} {...clickProps} />
  ))
  .add('Closed', () => (
    <StatusToggle activeStatus={statusConstants.CLOSED} {...clickProps} />
  ))
  .add('Long-Term Closure', () => (
    <StatusToggle activeStatus={statusConstants.LONGTERM} {...clickProps} />
  ));
