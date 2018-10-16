import React, { Component, Fragment } from 'react';
import PropTypes from 'prop-types';

import Modal from 'components/Shared/Modal';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import IncidentLocationMap from './IncidentLocationMap';
import { AustinCenterLngLat } from 'constants/MapboxConstants';

export default class IncidentLocationModal extends Component {
  static propTypes = {
    lngLat: PropTypes.arrayOf(PropTypes.number),
    saveLngLat: PropTypes.func.isRequired,
  };

  constructor(props, ...args) {
    super(props, ...args);
    this.state = {
      lngLat: props.lngLat || AustinCenterLngLat,
    };
  }

  render() {
    return (
      <Modal
        isOpen
        title="Choose Incident Location"
        className="IncidentLocationModal"
        onClose={this.props.onClose}
        footer={
          <Fragment>
            <ButtonPrimary
              className="IncidentLocationModal__btn-primary"
              onClick={() => {
                this.props.saveLngLat(this.state.lngLat);
                this.props.onClose();
              }}
            >
              Save
            </ButtonPrimary>
            <ButtonSecondary onClick={this.props.onClose}>
              Cancel
            </ButtonSecondary>
          </Fragment>
        }
      >
        <div className="IncidentLocationMapContainer">
          <IncidentLocationMap
            coordinates={this.state.lngLat}
            onCoordinatesChange={e => {
              this.setState({ lngLat: [e.lngLat.lng, e.lngLat.lat] });
            }}
          />
        </div>
      </Modal>
    );
  }
}
