import React from 'react';
import { storiesOf } from '@storybook/react';
import CrossingListHeader from '../Dashboard/CrossingListPage/CrossingListHeader/CrossingListHeader';
import schema from './schema/schema';
import { withApolloProvider } from 'storybook-addon-apollo-graphql';

const root = {
  allCrossings: () => ({ totalCount: 6})
};

storiesOf('Crossing List Header', module)
  .addDecorator(withApolloProvider({ schema, root }))
  .add('Large Width', () => 
    <div class="storybook--lg">
      <CrossingListHeader />
    </div>)
  .add('Small Width', () => 
    <div class="storybook--sm">
	  	<CrossingListHeader />
    </div>
  );
