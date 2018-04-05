import React, { Component } from 'react';

export default class Header extends Component {
  render() {
    return (
      <div className="Header">
        <div className="Header__main">
          {this.props.children}
        </div>
      </div>
    );
  }
}
