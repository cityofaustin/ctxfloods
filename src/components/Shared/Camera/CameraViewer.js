import React, { Component } from 'react';
import PropTypes from 'prop-types';

class CameraViewer extends Component {
  static propTypes = {
    cameraType: PropTypes.string,
    cameraId: PropTypes.string,
  };

  render() {
    const { cameraType, cameraId } = this.props;

    return (
      <div>
      {cameraType === 'beholder' &&
        <iframe src={`https://my.beholderhq.com/cameras/${cameraId}/carousel`} />
      }
      </div>
    );
  }
}

export default CameraViewer;
