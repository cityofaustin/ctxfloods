import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import './Button.css';

class Button extends Component {

  render() {
    return (
      <Link to={this.props.linkTo} className="Button">
        {this.props.text}
      </Link>
    );
  }

}

export default Button;
