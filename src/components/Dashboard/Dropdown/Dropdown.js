import React, { Component } from 'react';
import 'components/Dashboard/Dropdown/Dropdown.css';

import FontAwesome from 'react-fontawesome';

class Dropdown extends Component {
  render() {
    const { selected, options, disabled } = this.props;

    return (
      <div className="Dropdown">
        <select
          className="Dropdown__select"
          name=""
          id=""
          onChange={this.props.onChange}
          defaultValue={selected}
          disabled={disabled}
        >
          {options.map(opt => (
            <option value={opt.id} key={opt.id}>
              {opt.name}
            </option>
          ))}
          <div className="Chevron">
            <FontAwesome name="chevron-down" />
          </div>
        </select>
      </div>
    );
  }
}

export default Dropdown;
