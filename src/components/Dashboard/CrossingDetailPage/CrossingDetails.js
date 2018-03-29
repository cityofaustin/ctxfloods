import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
import { Redirect } from 'react-router';
import _ from 'lodash';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';

import updateCrossingFragment from 'components/Dashboard/CrossingListPage/queries/updateCrossingFragment';
import addCrossingToCommunityFragment from 'components/Dashboard/CrossingListPage/queries/addCrossingToCommunityFragment';
import Dropdown from 'components/Dashboard/Dropdown/Dropdown';

import CommunityTag from './CommunityTag';
import DeleteCrossingButton from './DeleteCrossingButton';

import 'components/Dashboard/CrossingDetailPage/CrossingDetails.css';

class CrossingDetails extends Component {
  constructor(props) {
    super(props);

    const { crossing, allCommunities, crossingCommunities } = props;
    var dropdownCommunities = allCommunities.slice();
    _.pullAllBy(dropdownCommunities, crossingCommunities, 'id');

    this.state = {
      name: crossing.name,
      description: crossing.description,
      addCommunity: false,
      selectedCommunityId:
        dropdownCommunities.length > 0 ? dropdownCommunities[0].id : null,
      communityToRemove: null,
      redirectToNewCrossingId: null,
      dropdownCommunities: dropdownCommunities,
    };
  }

  updateCrossing = e => {
    this.props
      .updateCrossingMutation({
        variables: {
          crossingId: this.props.crossing.id,
          name: this.state.name,
          description: this.state.description,
        },
        update: (store, { data: { editCrossing } }) => {
          const updatedCrossing = editCrossing.crossing;
          store.writeFragment({
            id: 'Crossing:' + updatedCrossing.id,
            fragment: updateCrossingFragment,
            data: updatedCrossing,
          });
        },
      })
      .then(({ data }) => {
        console.log('success', data);
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
      });
  };

  addCrossing = e => {
    this.props
      .addCrossingMutation({
        variables: {
          name: this.state.name,
          humanAddress: this.state.humanAddress,
          description: this.state.description,
          communityId: this.props.currentUser.communityId,
          longitude: this.props.crossing.lng,
          latitude: this.props.crossing.lat,
        },
      })
      .then(({ data }) => {
        console.log('success', data);
        const { id } = data.newCrossing.crossing;
        this.setState({ redirectToNewCrossingId: id });
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
      });
  };

  addCommunity = e => {
    this.props
      .addCrossingToCommunityMutation({
        variables: {
          crossingId: this.props.crossing.id,
          communityId: this.state.selectedCommunityId,
        },
        update: (store, { data: { addCrossingToCommunity } }) => {
          const updatedCrossing = addCrossingToCommunity.crossing;
          store.writeFragment({
            id: 'Crossing:' + updatedCrossing.id,
            fragment: addCrossingToCommunityFragment,
            data: updatedCrossing,
          });
        },
      })
      .then(({ data }) => {
        console.log('success', data);

        const { allCommunities, crossingCommunities } = this.props;
        var dropdownCommunities = allCommunities.slice();
        _.pullAllBy(dropdownCommunities, crossingCommunities, 'id');

        this.setState({
          addCommunity: false,
          dropdownCommunities: dropdownCommunities,
          selectedCommunityId:
            dropdownCommunities.length > 0 ? dropdownCommunities[0].id : null,
        });
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
      });
  };

  removeCommunity = e => {
    this.props
      .removeCrossingFromCommunityMutation({
        variables: {
          crossingId: this.props.crossing.id,
          communityId: this.state.communityToRemove.id,
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
        console.log('success', data);

        const { allCommunities, crossingCommunities } = this.props;
        var dropdownCommunities = allCommunities.slice();
        _.pullAllBy(dropdownCommunities, crossingCommunities, 'id');

        this.setState({
          removeCommunity: false,
          dropdownCommunities: dropdownCommunities,
          selectedCommunityId:
            dropdownCommunities.length > 0 ? dropdownCommunities[0].id : null,
        });
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
      });
  };

  nameChanged = e => {
    this.setState({
      name: e.target.value,
    });
  };

  descriptionChanged = e => {
    this.setState({
      description: e.target.value,
    });
  };

  humanAddressChanged = e => {
    this.setState({
      humanAddress: e.target.value,
    });
  };

  cancelClicked = () => {
    this.setState({
      name: this.props.crossing.name,
      description: this.props.crossing.description,
    });
  };

  addCommunityClicked = () => {
    this.setState({ addCommunity: true });
  };

  addCommunityCancelClicked = () => {
    this.setState({ addCommunity: false });
  };

  removeCommunityClicked = community => {
    this.setState({ removeCommunity: true, communityToRemove: community });
  };

  removeCommunityCancelClicked = () => {
    this.setState({ removeCommunity: false, communityToRemoveId: null });
  };

  selectedCommunityChanged = e => {
    this.setState({ selectedCommunityId: e.target.value });
  };

  isDirty() {
    return (
      this.props.crossing.name !== this.state.name ||
      this.props.crossing.description !== this.state.description
    );
  }

  render() {
    // If we finished adding a crossing, we should redirect to the edit page
    if (this.state.redirectToNewCrossingId) {
      return (
        <Redirect
          push
          to={`/dashboard/crossing/${this.state.redirectToNewCrossingId}`}
        />
      );
    }

    const { crossing, crossingCommunities, addMode, currentUser } = this.props;
    const { dropdownCommunities, name, humanAddress, description } = this.state;

    return (
      <div className="CrossingDetails">
        {/* FIXME: Add dirty state */}
        <div className="CrossingDetails__details">
          {!addMode && (
            <div>
              {!crossing.active ? (
                <div>
                  <span>INACTIVE</span>
                </div>
              ) : null}
              <div>
                <span>ID#</span> <span>{crossing.id}</span>
              </div>
              <div>
                <span>Address</span> <span>{crossing.humanAddress}</span>
              </div>
            </div>
          )}

          <div>
            <span>GPS</span> <span>{crossing.humanCoordinates}</span>
          </div>

          <div>
            <div>
              <div>
                <span>Display Name*</span>
              </div>
              <span>
                Name your crossings by intersections (ie, Onion Creek Blvd. &
                5th Ave) or waypoints (5th Ave. Denny’s)
              </span>
            </div>
            <input
              id="crossingName"
              className="input input--lg"
              type="text"
              value={name ? name : ''}
              onChange={this.nameChanged}
            />
          </div>

          {addMode && (
            <div>
              <div>
                <div>
                  <span>Street Address*</span>
                </div>
                <span>The human readable address for the crossing</span>
              </div>

              <input
                className="input"
                type="text"
                value={humanAddress ? humanAddress : ''}
                onChange={this.humanAddressChanged}
              />
            </div>
          )}

          <div>
            <div>
              <div>
                <span>Additional Description (optional)</span>
              </div>
              <span>
                Does the location need additional clarification? ie, "Southbound
                lane only"
              </span>
            </div>
            <input
              id="crossingDescription"
              className="input"
              type="text"
              value={description ? description : ''}
              onChange={this.descriptionChanged}
            />
          </div>

          <div className="CrossingDetails__communities ">
            {crossingCommunities.map(community => {
              return (
                <CommunityTag
                  community={community}
                  isRemovable={
                    currentUser.role === 'floods_super_admin' &&
                    crossingCommunities.length > 1
                  }
                  removeCommunity={this.removeCommunityClicked}
                />
              );
            })}
            {!this.state.addCommunity &&
              dropdownCommunities.length > 0 &&
              currentUser.role !== 'floods_community_editor' && (
                <button
                  className="button button--secondary"
                  onClick={this.addCommunityClicked}
                >
                  Add Community +
                </button>
              )}
          </div>
        </div>

        {this.state.addCommunity && (
          <div>
            <Dropdown
              options={dropdownCommunities}
              selected={this.state.selectedCommunityId}
              onChange={this.selectedCommunityChanged}
            />

            <div className="CrossingDetails__addCommunityButtons">
              <button
                className="button button--cancel"
                onClick={this.addCommunityCancelClicked}
              >
                Cancel
              </button>
              <button
                className="button button--confirm"
                onClick={this.addCommunity}
              >
                Save
              </button>
            </div>
          </div>
        )}
        {addMode && (
          <div className="CrossingDetails__buttons">
            <button
              className="button button--confirm"
              onClick={this.addCrossing}
            >
              Add Crossing
            </button>
          </div>
        )}

        {!addMode && (
          <div className="CrossingDetails__buttons">
            <ButtonPrimary onClick={this.updateCrossing}>Update</ButtonPrimary>
            <ButtonSecondary onClick={this.cancelClicked}>
              Cancel
            </ButtonSecondary>
          </div>
        )}

        {crossing.active &&
          currentUser.role !== 'floods_community_editor' &&
          crossingCommunities.length === 1 && (
            <div className="CrossingDetails__buttons">
              <DeleteCrossingButton crossingId={crossing.id} />
            </div>
          )}

        {this.state.removeCommunity && (
          <div className="CrossingDetails__delete overlay-container">
            <div>
              <p>
                This will remove the crossing from{' '}
                {this.state.communityToRemove.name}
              </p>
              <p>Do you want to continue?</p>
              <div>
                <button
                  className="button button--cancel"
                  onClick={this.removeCommunityCancelClicked}
                >
                  No, Go Back
                </button>
                <button
                  className="button button--confirm"
                  onClick={this.removeCommunity}
                >
                  Yes, Remove
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    );
  }
}

const updateCrossingMutation = gql`
  mutation editCrossing(
    $crossingId: Int!
    $name: String!
    $description: String!
  ) {
    editCrossing(
      input: { crossingId: $crossingId, name: $name, description: $description }
    ) {
      crossing {
        id
        name
        description
      }
    }
  }
`;

const addCrossingMutation = gql`
  mutation addCrossing(
    $name: String!
    $humanAddress: String!
    $description: String!
    $communityId: Int!
    $longitude: Float!
    $latitude: Float!
  ) {
    newCrossing(
      input: {
        name: $name
        humanAddress: $humanAddress
        description: $description
        communityId: $communityId
        longitude: $longitude
        latitude: $latitude
      }
    ) {
      crossing {
        id
      }
    }
  }
`;

const addCrossingToCommunityMutation = gql`
  mutation addCrossingToCommunityMutation(
    $crossingId: Int!
    $communityId: Int!
  ) {
    addCrossingToCommunity(
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

export default compose(
  graphql(updateCrossingMutation, {
    name: 'updateCrossingMutation',
  }),
  graphql(addCrossingMutation, {
    name: 'addCrossingMutation',
  }),
  graphql(addCrossingToCommunityMutation, {
    name: 'addCrossingToCommunityMutation',
  }),
  graphql(removeCrossingFromCommunityMutation, {
    name: 'removeCrossingFromCommunityMutation',
  }),
)(CrossingDetails);
