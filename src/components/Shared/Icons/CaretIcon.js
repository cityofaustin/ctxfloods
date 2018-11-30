import React from 'react';
import FontAwesome from 'react-fontawesome';

import 'components/Shared/Icons/icon.css';

export default function CaretIcon({ isEnabled }) {
  return (
    <div className="CrossingListHeader-icon">
      {isEnabled ? (
        <FontAwesome name="caret-up" ariaLabel="Ascending" />
      ) : (
        <FontAwesome name="caret-down" ariaLabel="Descending" />
      )}
    </div>
  );
}
