import React, { Component } from 'react';
import { get } from 'lodash';
import PropTypes from 'prop-types';

import CtxFloodsLogoDarkSvg from 'images/ctx-floods-logo-dark.svg';
import './Header.css';

export default class Header extends Component {
  static propTypes = {
    location: PropTypes.object.isRequired,
    title: PropTypes.string,
    children: PropTypes.node.isRequired,
  };

  componentDidMount() {
    const pathname = get(this, 'props.location.pathname');
    const suffix = pathname ? `- ${pathname}` : '';
    document.title = `Central Texas Floods - Turn Around, Don\'t Drown`;
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
            <div className="Header__title">{this.props.title}</div>
          </h1>
          <ul className="Header__tabs">{this.props.children}</ul>
        </div>
      </div>
    );
  }
}
