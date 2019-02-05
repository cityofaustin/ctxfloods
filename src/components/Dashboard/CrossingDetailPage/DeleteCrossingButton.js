import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';

import { logError } from 'services/logger';
import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import deleteCrossingFragment from 'components/Dashboard/CrossingListPage/queries/deleteCrossingFragment';

import './DeleteCrossingButton.css';

class DeleteCrossingButton extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      isModalOpen: false,
      errorMessage: null,
    };
  }

  showDeleteModal = () => {
    this.setState({ isModalOpen: true, errorMessage: null });
  };

  closeDeleteModal = () => {
    this.setState({ isModalOpen: false, errorMessage: null });
  };

  deleteCrossing = () => {
    this.setState({ errorMessage: null });
    this.props
      .deleteCrossingMutation({
        variables: {
          crossingId: Number(this.props.crossingId),
        },
        update: (store, { data: { removeCrossing } }) => {
          const deletedCrossing = removeCrossing.crossing;
          store.writeFragment({
            id: 'Crossing:' + deletedCrossing.id,
            fragment: deleteCrossingFragment,
            data: deletedCrossing,
          });
        },
      })
      .then(() => {
        // FIXME: <DeleteCrossingButton> is unmounted before this is run
        this.setState({ isModalOpen: false });
      })
      .catch(err => {
        logError(err);
        this.setState({ errorMessage: err.message });
      });
  };

  render() {
    return (
      <div>
        <ButtonSecondary
          onClick={this.showDeleteModal}
        >
          Delete Crossing
        </ButtonSecondary>
        <Modal
          title="Delete Crossing"
          isOpen={this.state.isModalOpen}
          onClose={this.closeDeleteModal}
          footer={
            <div>
              <ButtonPrimary
                className="ConfirmDeleteCrossingModal__delete-button"
                onClick={this.deleteCrossing}
              >
                Delete
              </ButtonPrimary>
              <ButtonSecondary onClick={this.closeDeleteModal}>
                Cancel
              </ButtonSecondary>
            </div>
          }
        >
          <div className="">
            <p>
              The historical data for this crossing will be saved, but you will
              no longer be able to view or change the change this crossing’s
              status.
            </p>
            <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
          </div>
        </Modal>
      </div>
    );
  }
}

const deleteCrossingMutation = gql`
  mutation deleteCrossingMutation($crossingId: Int!) {
    removeCrossing(input: { crossingId: $crossingId }) {
      crossing {
        id
        active
      }
    }
  }
`;

export default graphql(deleteCrossingMutation, {
  name: 'deleteCrossingMutation',
})(DeleteCrossingButton);
