import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import compare from 'components/../services/math.js';
import './Form.css';

export default class FloatInput extends Component {
  constructor(props) {
    super(props);

    this.onChange = this.onChange.bind(this);
  }

  onChange = (e) => {
    const { id, propagateChange, lowerBound, upperBound } = this.props;
    let newValue = e.target.value.trim();

    // If someone copy and pastes a lat/lng with more significant digits.
    let valSplit = newValue.split('.');
    let maxSigDigits = 15;
    if ((valSplit[1] && valSplit[1].length > maxSigDigits)) {
      newValue = valSplit[0] + '.' + valSplit[1].substring(0,maxSigDigits);
    }

    if (newValue === '' || newValue === '-') {
      propagateChange({
        value: newValue,
        errorMessage: `Missing ${id} value.`
      });
    } else if (
      // must be number or empty string
      // numbers can't have more than 14 digits after decimal place
      // can't be larger than 90 or less than -90
      (isNaN(newValue) && (newValue !== '')) ||
      (newValue < -180) ||
      (newValue > 180)
    ) {
      e.preventDefault()
    } else {
      if (compare(newValue, 'lt', lowerBound)) {
        propagateChange({
          value: newValue,
          errorMessage: `${id} must be greater than ${lowerBound}`
        });
      } else if (compare(newValue, 'gt', upperBound)) {
        propagateChange({
          value: newValue,
          errorMessage: `${id} must be less than ${lowerBound}`
        });
      } else {
        propagateChange({
          value: newValue,
          errorMessage: null
        });
      }
    }
  }

  render() {
    const {
      value,
      errorMessage,
      className,
      isDisabled
    } = this.props;
    return (
      <input
        style={{width: "100%"}}
        type="text"
        value={value}
        onChange={this.onChange}
        className={classNames(
          'Shared__text-input',
          { 'Shared__text-input--disabled': isDisabled },
          { 'invalid_input': !!errorMessage},
          className,
        )}
        disabled={isDisabled}
      />
    )
  }
}

FloatInput.propTypes = {
  id: PropTypes.string,
  value: PropTypes.string,
  className: PropTypes.string,
  propagateChange: PropTypes.func,
  isDisabled: PropTypes.bool,
  lowerBound: PropTypes.number,
  upperBound: PropTypes.number
};

FloatInput.defaultProps = {
  isDisabled: false,
};
