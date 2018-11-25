import React, { Component } from 'react';
import classNames from 'classnames';

import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import FloatInput from 'components/Shared/Form/FloatInput';
import Label from 'components/Shared/Form/Label';
import 'components/Dashboard/CrossingDetailPage/CrossingDetails.css';

export default class LatLngInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      lat: props.lat || '',
      lng: props.lng || '',
      latError: null,
      lngError: null
    }
  }

  latChanged = ({value, errorMessage}) => {
    this.setState({
      lat: value,
      latError: errorMessage
    });
  }

  lngChanged = ({value, errorMessage}) => {
    this.setState({
      lng: value,
      lngError: errorMessage
    });
  }

  onSubmit = () => {
    this.props.latLngInputChanged({
      lat: this.state.lat,
      lng: this.state.lng,
    });
  }

  onCancel = () => {
    this.setState({
      lat: this.props.lat,
      lng: this.props.lng,
      latError: null,
      lngError: null
    })
  }

  render() {
    const {
      addMode,
      minLat, maxLat,
      minLng, maxLng,
    } = this.props;

    const {
      lat, lng, latError, lngError
    } = this.state;

    const readyToSubmit = !latError && !lngError;
    const isDirty = ((this.state.lat.toString() !== this.props.lat.toString()) || (this.state.lng.toString() !== this.props.lng.toString()));

    return (
      <div className="CrossingDetails__lat-lng-group">
        <div className="CrossingDetails__lat-lng-container">
          <Label htmlFor="Latitude">Latitude*</Label>
          <FloatInput
            id="Latitude"
            value={lat.toString()}
            propagateChange={this.latChanged}
            isDisabled={!addMode}
            lowerBound={minLat}
            upperBound={maxLat}
            errorMessage={latError}
          />
        </div>
        <div className="space_5"/>
        <div className="CrossingDetails__lat-lng-container">
          <Label htmlFor="Longitude">Longitude*</Label>
          <FloatInput
            id="Longitude"
            value={lng.toString()}
            propagateChange={this.lngChanged}
            isDisabled={!addMode}
            lowerBound={minLng}
            upperBound={maxLng}
            errorMessage={lngError}
          />
        </div>
        <div
          className={classNames(
            "EditUser__buttons",
            {"hidden": !isDirty},
          )}
          style={{paddingLeft: 0}}
        >
          <ButtonSecondary
            className="EditUser__cancel-button"
            onClick={this.onCancel}
          >
            Cancel
          </ButtonSecondary>
          <ButtonPrimary
            className="EditUser__next-button"
            onClick={this.onSubmit}
            disabled={!readyToSubmit}
          >
            Apply
          </ButtonPrimary>
        </div>
      </div>
    )


  }
}
