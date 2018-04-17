import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import React, { Component } from 'react';
import PropTypes from 'prop-types';

import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import crossingCameraFragment from 'components/Dashboard/CrossingListPage/queries/crossingCameraFragment';

class CameraEditModal extends Component {
  static propTypes = {
    crossingId: PropTypes.number.isRequired,
    cameraType: PropTypes.string,
    cameraId: PropTypes.string,
    onClose: PropTypes.func.isRequired,
  };

  constructor(props) {
    super(props);

    this.state = {
      errorMessage: null,
      cameraType: props.cameraType || '',
      cameraId: props.cameraId || '',
    };
  }

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  updateCamera = e => {
    this.props
      .updateCameraMutation({
        variables: {
          crossingId: this.props.crossingId,
          cameraType: this.state.cameraType,
          cameraId: this.state.cameraId,
        },
        update: (store, { data: { setCameraForCrossing } }) => {
          const updatedCrossing = setCameraForCrossing.crossing;
          store.writeFragment({
            id: 'Crossing:' + updatedCrossing.id,
            fragment: crossingCameraFragment,
            data: updatedCrossing,
          });
        },
      })
      .then(({ data }) => {
        this.props.onClose();
      })
      .catch(err => {
        console.error(err);
        this.setState({ errorMessage: err.message });
      });
  };

  render() {
    return (
      <Modal
        title="Edit Camera"
        isOpen
        onClose={this.props.onClose}
        footer={
          <div>
            <ButtonPrimary
              onClick={this.updateCamera}
            >
              Save
            </ButtonPrimary>
            <ButtonSecondary onClick={this.props.onClose}>
              Cancel
            </ButtonSecondary>
          </div>
        }
      >
      ADD A CAMERA
        {this.state.errorMessage && (
          <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

const updateCameraMutation = gql`
  mutation($crossingId:Int!, $cameraId:String!, $cameraType:String!) {
    setCameraForCrossing(input:{crossingId:$crossingId, cameraId:$cameraId, cameraType:$cameraType}) {
      crossing {
        id
        cameraId
        cameraType
      }
    }
  }
`;

export default graphql(updateCameraMutation, {
  name: 'updateCameraMutation',
})(CameraEditModal);
