import React from 'react';

import './ContentPage.css';

export default function ContentPage({
  children
}) {
  return (
    <div className="ContentPage">
      {children}
    </div>
  );
}
