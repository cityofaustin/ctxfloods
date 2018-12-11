import React, { Component } from 'react';
import 'components/Shared/Form/Dropdown/Dropdown.css';

class Dropdown extends Component {
  render() {
    const { onChange, selected, options, disabled } = this.props;

    return (
      <div className="Dropdown">
        <select
          className="Dropdown__select"
          name=""
          id=""
          onChange={onChange}
          value={selected}
          disabled={disabled}
        >
          {options.map(opt => (
            <option value={opt.id} key={opt.id}>
              {opt.name}
            </option>
          ))}
        </select>
      </div>
    );
  }
}

export default Dropdown;
