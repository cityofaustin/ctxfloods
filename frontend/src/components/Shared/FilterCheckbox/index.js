import React from 'react';

import CheckboxEnabledSvg from 'images/checkbox-enabled.svg';
import CheckboxDisabledSvg from 'images/checkbox-disabled.svg';

import './FilterCheckbox.css';

export default function FilterCheckbox({ isChecked, onClick, children }) {
  return (
    <label className="FilterCheckbox">
      <input
        type="image"
        src={isChecked ? CheckboxEnabledSvg : CheckboxDisabledSvg}
        className="FilterCheckbox__button"
        role="checkbox"
        aria-checked={isChecked}
        onClick={onClick}
        alt={isChecked ? 'Enabled' : 'Disabled'}
      />
      <div className="FilterCheckbox__children">{children}</div>
    </label>
  );
}
