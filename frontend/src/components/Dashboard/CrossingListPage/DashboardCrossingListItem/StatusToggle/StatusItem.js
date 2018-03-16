import React, { Component } from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

export default class StatusItem extends Component {
  static propTypes = {
    onClick: PropTypes.func.isRequired,
    iconSrc: PropTypes.string.isRequired,
    // hoverIconSrc: PropTypes.string.isRequired,
    alt: PropTypes.string.isRequired,
    className: PropTypes.string.isRequired,
  };
  render() {
    return (
      <div
        className={classNames([
          'StatusToggle',
          this.props.className,
          this.props.isActive && 'active',
        ])}
        onClick={this.props.onClick}
      >
        <img
          src={
            this.props.isActive ? this.props.activeIconSrc : this.props.iconSrc
          }
          alt={this.props.alt}
        />
      </div>
    );
  }
}
