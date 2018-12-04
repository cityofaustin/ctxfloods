import React from 'react';
import FontAwesome from 'react-fontawesome';

import 'components/Shared/Icons/icon.css';

export default function XIcon() {
  return (
    <div className="icon x-icon">
      <FontAwesome name="times" ariaLabel="Show" />
    </div>
  );
}
