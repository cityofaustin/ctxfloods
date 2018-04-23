import React from 'react';
import ReactDOM from 'react-dom';
import App from 'App';
import Raven from 'raven-js';

import { SENTRY_DSN } from 'constants/AppConstants';

import 'index.css';

if (process.env.NODE_ENV === 'production') {
  Raven.config(SENTRY_DSN).install();
}

Raven.context(function() {
  ReactDOM.render(<App />, document.getElementById('root'));
});
