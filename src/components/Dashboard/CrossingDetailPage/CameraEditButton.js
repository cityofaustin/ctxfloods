import React, { Component, Fragment } from 'react';
import PropTypes from 'prop-types';
import FontAwesome from 'react-fontawesome';

import CameraEditModal from './CameraEditModal';

export default class CameraEditButton extends Component {
  static propTypes = {
    crossingId: PropTypes.number.isRequired,
    cameraType: PropTypes.string,
    cameraId: PropTypes.string,
  };

  constructor(...args) {
    super(...args);
    this.state = {
      isOpen: false,
    };
  }

  render() {
    const { crossingId, cameraType, cameraId } = this.props;
    return (
      <Fragment>
        <button
          onClick={() => {
            this.setState({
              isOpen: true,
            });
          }}
        >
        <FontAwesome
          name="camera"
          size="lg"
        />
        </button>
        {this.state.isOpen && (
          <CameraEditModal crossingId={crossingId} cameraType={"cameraType"} cameraId={cameraId} onClose={() => this.setState({isOpen: false})}/>
        )}
      </Fragment>
    );
  }
}
