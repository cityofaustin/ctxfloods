import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import React, { Component } from 'react';
import PropTypes from 'prop-types';

import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import addCrossingToCommunityFragment from 'components/Dashboard/CrossingListPage/queries/addCrossingToCommunityFragment';

class CommunityRemoveModal extends Component {
  static propTypes = {
    crossing: PropTypes.object.isRequired,
    community: PropTypes.object.isRequired,
    onClose: PropTypes.func.isRequired,
  };

  constructor(...args) {
    super(...args);

    this.state = {
      errorMessage: null,
    };
  }

  componentDidCatch(err) {
    console.error(err);
    this.setState({ errorMessage: err.message });
  }

  removeCommunity = e => {
    this.props
      .removeCrossingFromCommunityMutation({
        variables: {
          crossingId: this.props.crossing.id,
          communityId: this.props.community.id,
        },
        update: (store, { data: { removeCrossingFromCommunity } }) => {
          const updatedCrossing = removeCrossingFromCommunity.crossing;
          store.writeFragment({
            id: 'Crossing:' + updatedCrossing.id,
            fragment: addCrossingToCommunityFragment,
            data: updatedCrossing,
          });
        },
      })
      .then(({ data }) => {
        this.props.onClose();
        this.props.onCommunityRemoved();
      })
      .catch(err => {
        console.error(err);
        this.setState({ errorMessage: err.message });
      });
  };

  render() {
    return (
      <Modal
        title="Remove Community"
        isOpen
        onClose={this.props.onClose}
        footer={
          <div>
            <ButtonPrimary className="CommunityRemoveModal__primary-button" onClick={this.removeCommunity}>Remove</ButtonPrimary>
            <ButtonSecondary onClick={this.props.onClose}>
              Cancel
            </ButtonSecondary>
          </div>
        }
      >
        <p>This will remove the crossing from {this.props.community.name}.</p>
        <p>Do you want to continue?</p>
        {this.state.errorMessage && (
          <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

const removeCrossingFromCommunityMutation = gql`
  mutation removeCrossingFromCommunityMutation(
    $crossingId: Int!
    $communityId: Int!
  ) {
    removeCrossingFromCommunity(
      input: { crossingId: $crossingId, communityId: $communityId }
    ) {
      crossing {
        id
        communityIds
        communities {
          nodes {
            id
            name
          }
        }
      }
    }
  }
`;

export default graphql(removeCrossingFromCommunityMutation, {
  name: 'removeCrossingFromCommunityMutation',
})(CommunityRemoveModal);
