import React, { Component } from 'react';
import { get } from 'lodash';

import CtxFloodsLogoDarkSvg from 'images/ctx-floods-logo-dark.svg';
import './Header.css';

export default class Header extends Component {
  componentDidMount() {
    const pathname = get(this, 'props.location.pathname');
    const suffix = pathname ? `- ${pathname}` : '';
    document.title = `CTXFloods ${suffix}`;
  }

  render() {
    return (
      <div className="Header">
        <div className="Header__main">
          <h1 className="Header__logo">
            <img
              src={CtxFloodsLogoDarkSvg}
              alt="CTXfloods | Central Texas Floods"
            />
          </h1>
          <div className="Header__main">
            <ul className="Header__tabs">{this.props.children}</ul>
          </div>
        </div>
      </div>
    );
  }
}
