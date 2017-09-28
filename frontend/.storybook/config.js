import { configure } from '@storybook/react';

function loadStories() {
  require('../src/stories/userList.js');
  require('../src/stories/statusToggle.js');
  require('../src/stories/crossingListItem.js');
}

configure(loadStories, module);
