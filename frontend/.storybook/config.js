import { configure } from '@storybook/react';

function loadStories() {
  require('../stories/index.js');
  //require('../stories/adminCrossingList.js');
  require('../stories/helloWorld.js');
  // You can require as many stories as you need.
  require('../stories/userList.js');
}


configure(loadStories, module);
