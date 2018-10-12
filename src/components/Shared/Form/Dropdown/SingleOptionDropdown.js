import React, { Component } from 'react';
import 'components/Shared/Form/Dropdown/Dropdown.css';

class SingleOptionDropdown extends Component {
  render() {
    const { option } = this.props;

    return (
      <div className="SingleOptionDropdown">
        {option}
      </div>
    );
  }
}

export default SingleOptionDropdown;
