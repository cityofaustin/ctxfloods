import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
import { Redirect } from 'react-router';
import _ from 'lodash';
import FontAwesome from 'react-fontawesome';
import { logError } from 'services/logger';

import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import TextInput from 'components/Shared/Form/TextInput';
import InputDescription from 'components/Shared/Form/InputDescription';
import Label from 'components/Shared/Form/Label';

import updateCrossingFragment from 'components/Dashboard/CrossingListPage/queries/updateCrossingFragment';
import addCrossingToCommunityFragment from 'components/Dashboard/CrossingListPage/queries/addCrossingToCommunityFragment';
import Dropdown from 'components/Shared/Form/Dropdown';

import CommunityTag from './CommunityTag';
import CommunityTagAddButton from './CommunityTagAddButton';
import DeleteCrossingButton from './DeleteCrossingButton';

import CameraEditButton from './CameraEditButton';

import 'components/Dashboard/CrossingDetailPage/CrossingDetails.css';

class CrossingDetails extends Component {
  constructor(props) {
    super(props);

    const { crossing, allCommunities, crossingCommunities } = props;
    var dropdownCommunities = allCommunities.slice();
    _.pullAllBy(dropdownCommunities, crossingCommunities, 'id');

    this.state = {
      name: crossing.name || '',
      description: crossing.description || '',
      humanAddress: crossing.humanAddress || '',
      addCommunity: false,
      selectedCommunityId:
        dropdownCommunities.length > 0 ? dropdownCommunities[0].id : null,
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
      .catch(err => {
        // FIXME: Show error
        logError(err);
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
        const { id } = data.newCrossing.crossing;
        this.setState({ redirectToNewCrossingId: id });
      })
      .catch(err => {
        // FIXME: Show error
        logError(err);
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
      .catch(err => {
        // FIXME: Show error
        logError(err);
      });
  };

  onCommunityRemoved = () => {
    const { allCommunities, crossingCommunities } = this.props;
    var dropdownCommunities = allCommunities.slice();
    _.pullAllBy(dropdownCommunities, crossingCommunities, 'id');

    this.setState({
      dropdownCommunities: dropdownCommunities,
      selectedCommunityId:
        dropdownCommunities.length > 0 ? dropdownCommunities[0].id : null,
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

    return (
      <div className="CrossingDetails">
        {!crossing.active &&
          !addMode && (
            <div className="CrossingDetails__archived">
              <FontAwesome
                name="exclamation-triangle"
                className="CrossingDetails__archived-icon"
                size="lg"
              />
              Crossing has been archived.
            </div>
          )}
        <div className="CrossingDetails__details-container">
          <div className="CrossingDetails__details">
            <div className="CrossingDetails__field-group">
              <Label htmlFor="crossingName">Display Name*</Label>
              <TextInput
                id="crossingName"
                value={this.state.name}
                onChange={this.nameChanged}
              />
              <InputDescription>
                Name your crossings by intersections (ie, Onion Creek Blvd. &
                5th Ave) or waypoints (5th Ave. Denny’s)
              </InputDescription>
            </div>
            <div className="CrossingDetails__field-group">
              <Label htmlFor="streetAddress">Street Address*</Label>
              <TextInput
                id="streetAddress"
                value={this.state.humanAddress}
                onChange={this.humanAddressChanged}
              />
              <InputDescription>
                The human readable address for the crossing
              </InputDescription>
            </div>
            <div className="CrossingDetails__field-group">
              <Label htmlFor="crossingDescription">
                Additional Description (Optional)
              </Label>
              <TextInput
                id="crossingDescription"
                value={this.state.description}
                onChange={this.descriptionChanged}
              />
              <InputDescription>
                Does the location need additional clarification? ie, “Southbound
                lane only”
              </InputDescription>
            </div>
          </div>
          <div className="CrossingDetails__aside">
            {!addMode && (
              <div className="CrossingDetails__field-group">
                <Label>GPS</Label>
                <TextInput isDisabled value={crossing.humanCoordinates} />
              </div>
            )}
            {!addMode && (
              <div className="CrossingDetails__field-group">
                <Label>ID#</Label> <TextInput isDisabled value={crossing.id} />
              </div>
            )}
            {!addMode && (
              <CameraEditButton
                crossingId={crossing.id}
                cameraType={crossing.cameraType}
                cameraId={crossing.cameraId}
              />
            )}
            <div className="CrossingDetails__communities">
              <Label>{!addMode ? "Communities" : "Community"}</Label>
              <div className="CrossingDetails__communities-list">
                {crossingCommunities.map(community => {
                  return (
                    <CommunityTag
                      key={community.id}
                      community={community}
                      crossing={crossing}
                      isRemovable={
                        currentUser.role === 'floods_super_admin' &&
                        crossingCommunities.length > 1
                      }
                      onCommunityRemoved={this.onCommunityRemoved}
                    />
                  );
                })}
                { !this.props.addMode &&
                  !this.state.addCommunity &&
                  this.state.dropdownCommunities.length > 0 &&
                  currentUser.role !== 'floods_community_editor' && (
                    <CommunityTagAddButton onClick={this.addCommunityClicked} />
                  )}
              </div>

              {this.state.addCommunity && (
                <div>
                  <Dropdown
                    options={this.state.dropdownCommunities}
                    selected={this.state.selectedCommunityId}
                    onChange={this.selectedCommunityChanged}
                  />

                  <div className="CrossingDetails__addCommunityButtons">
                    <ButtonPrimary onClick={this.addCommunity}>
                      Save
                    </ButtonPrimary>
                    <ButtonSecondary onClick={this.addCommunityCancelClicked}>
                      Cancel
                    </ButtonSecondary>
                  </div>
                </div>
              )}
            </div>
          </div>
        </div>
        {!addMode && (
          <div className="CrossingDetails__buttons">
            <ButtonPrimary onClick={this.updateCrossing}>
              Update Crossing
            </ButtonPrimary>
            <ButtonSecondary onClick={this.cancelClicked}>
              Cancel
            </ButtonSecondary>
            {crossing.active &&
              currentUser.role !== 'floods_community_editor' &&
              crossingCommunities.length === 1 && (
                <div className="CrossingDetails__buttons">
                  <DeleteCrossingButton crossingId={crossing.id} />
                </div>
              )}
          </div>
        )}
        {addMode && (
          <div className="CrossingDetails__buttons">
            <ButtonPrimary onClick={this.addCrossing}>
              Add Crossing
            </ButtonPrimary>
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
    $longitude: BigFloat!
    $latitude: BigFloat!
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
)(CrossingDetails);
