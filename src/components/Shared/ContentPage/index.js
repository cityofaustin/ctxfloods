import React from 'react';
import classNames from 'classnames';

import './ContentPage.css';

export default function ContentPage({ children, className }) {
  return <div className={classNames('ContentPage', className)}>{children}</div>;
}
