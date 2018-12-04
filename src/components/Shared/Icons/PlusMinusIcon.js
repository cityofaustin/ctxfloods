import React from 'react';
import FontAwesome from 'react-fontawesome';

import 'components/Shared/Icons/icon.css';

export default function PlusMinusIcon({ isEnabled }) {
  return (
    <div className="CrossingListHeader-icon">
      {isEnabled ? (
        <FontAwesome name="minus" ariaLabel="Hide" />
      ) : (
        <FontAwesome name="plus" ariaLabel="Show" />
      )}
    </div>
  );
}
