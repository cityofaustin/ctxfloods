import React from 'react';
import { storiesOf } from '@storybook/react';
import { action } from '@storybook/addon-actions';
import AdminCrossingList from '../src/AdminCrossingList';

storiesOf('Admin Crossing List', module)
  .add('with text', () => (
    <AdminCrossingList/>
  ));
