import React from 'react';
import { graphql } from 'react-apollo';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';
import moment from 'moment';
import { logError } from 'services/logger';

import Date from 'components/Shared/DateTime/Date';
import Hour from 'components/Shared/DateTime/Hour';
import Location from 'components/Shared/CrossingListItem/Location';
import User from 'components/Shared/CrossingListItem/User';
import CrossingCommunityList from 'components/Shared/CrossingListItem/CrossingCommunityList';
import StatusToggle from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/StatusToggle';
import DashboardCrossingListItemControl from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/DashboardCrossingListItemControl';
import Dropdown from 'components/Shared/Form/Dropdown';
import DatePicker from 'components/Shared/DatePicker';
import SingleOptionDropdown from'components/Shared/Form/Dropdown/SingleOptionDropdown';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';

import newStatusUpdateMutation from 'components/Dashboard/CrossingListPage/queries/newStatusUpdateMutation';
import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
import allCrossings from 'components/Shared/Map/queries/allCrossingsQuery';
import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import statusUpdateFragment from 'components/Dashboard/CrossingListPage/queries/statusUpdateFragment';

import * as statusConstants from 'constants/StatusConstants';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';

import 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/DashboardCrossingListItem.css';

const containerQuery = {
  'DashboardCrossingListItem--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

class DashboardCrossingListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedStatus:
        props.crossing.statusUpdateByLatestStatusUpdateId.statusId,
      selectedReason:
        props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
      selectedReopenDate:
        props.crossing.statusUpdateByLatestStatusUpdateId.reopenDate,
      selectedIndefiniteClosure:
        props.crossing.statusUpdateByLatestStatusUpdateId.indefiniteClosure,
      notes: props.crossing.statusUpdateByLatestStatusUpdateId.notes,
    };
  }

  UNSAFE_componentWillMount() {
    const { restoreDirtyState, crossing } = this.props;
    if (restoreDirtyState) {
      const savedState = restoreDirtyState(crossing.id);
      if (savedState) {
        this.setState({ selectedStatus: savedState.selectedStatus });
        this.setState({ selectedReason: savedState.selectedReason });
        this.setState({ selectedReopenDate: savedState.selectedReopenDate });
        this.setState({ selectedIndefiniteClosure: savedState.selectedIndefiniteClosure });
        this.setState({ notes: savedState.notes });
        this.props.clearMeasurerCache();
      }
    }
  }

  componentWillUnmount() {
    const { saveDirtyState } = this.props;

    const stateToSave = {
      crossingId: this.props.crossing.id,
      selectedStatus: this.state.selectedStatus,
      selectedReason: this.state.selectedReason,
      selectedReopenDate: this.state.selectedReopenDate,
      selectedIndefiniteClosure: this.state.selectedIndefiniteClosure,
      notes: this.state.notes,
    };

    if (this.isDirty() && this.saveDirtyState) {
      saveDirtyState(stateToSave);
    }
  }

  fixSort(store, updatedCrossing) {
    // Get the edge from the current query
    const { crossingQueryVariables } = this.props;
    const data = store.readQuery({
      query: crossingsQuery,
      variables: crossingQueryVariables,
    });
    const edge = data.searchCrossings.edges.find(
      edge => edge.node.id === updatedCrossing.id,
    );

    // Get all the query variable combinations we have cached
    const queryVariables = Object.keys(store.data.data)
      .filter(query => query.includes('searchCrossings') && query.endsWith(')'))
      .map(q => JSON.parse(q.replace(/(^\$\w*\.\w*\()|(\)$)/g, '')));

    // Update the sorting accordingly
    for (var qv of queryVariables) {
      // Hacky fix for status counts
      if (qv.orderAsc === undefined) continue;

      const qvars = {
        orderAsc: qv.orderAsc,
        pageCursor: null,
        search: qv.search,
        showCaution: qv.showCaution,
        showClosed: qv.showClosed,
        showLongterm: qv.showLongterm,
        showOpen: qv.showOpen,
        communityId: qv.communityId,
      };

      this.doASortFix(store, updatedCrossing, qvars, edge);
    }
  }

  doASortFix(store, updatedCrossing, queryVariables, edge) {
    // Get the index of the updated crossing
    let index = -1;
    let data;
    try {
      data = store.readQuery({
        query: crossingsQuery,
        variables: queryVariables,
      });
      index = data.searchCrossings.edges.findIndex(
        edge => edge.node.id === updatedCrossing.id,
      );
    } catch (err) {
      logError(err);
      return;
    }

    // Remove it if it's on a list already
    if (index !== -1) {
      data.searchCrossings.edges.splice(index, 1);
    }

    // Add it to a list if appropriate
    if (
      (queryVariables.showOpen &&
        updatedCrossing.latestStatusId === statusConstants.OPEN) ||
      (queryVariables.showCaution &&
        updatedCrossing.latestStatusId === statusConstants.CAUTION) ||
      (queryVariables.showClosed &&
        updatedCrossing.latestStatusId === statusConstants.CLOSED) ||
      (queryVariables.showLongterm &&
        updatedCrossing.latestStatusId === statusConstants.LONGTERM)
    ) {
      if (queryVariables.orderAsc) {
        data.searchCrossings.edges.splice(-1, 0, edge);
      } else {
        data.searchCrossings.edges.splice(0, 0, edge);
      }
    }

    // write it to the apollo cache
    store.writeQuery({
      query: crossingsQuery,
      variables: queryVariables,
      data,
    });
  }

  updateMap(store, updatedCrossing) {
    // Update the selected crossing
    if (this.props.listOrMap === 'map') {
      this.props.selectCrossing(
        updatedCrossing.id,
        updatedCrossing.latestStatusId,
      );
    }

    // Get all the query variable combinations we have cached
    const queryVariables = Object.keys(store.data.data)
      .filter(query => query.includes('searchCrossings') && query.endsWith(')'))
      .map(q => JSON.parse(q.replace(/(^\$\w*\.\w*\()|(\)$)/g, '')));

    // Update the sorting accordingly
    for (var qv of queryVariables) {
      // Hacky fix for status counts
      if (qv.orderAsc !== undefined) continue;

      const qvars = {
        search: qv.search,
        showCaution: qv.showCaution,
        showClosed: qv.showClosed,
        showLongterm: qv.showLongterm,
        showOpen: qv.showOpen,
        communityId: qv.communityId,
      };

      this.doAMapFix(store, updatedCrossing, qvars);
    }
  }

  doAMapFix(store, updatedCrossing, qvars) {
    // Get the index of the updated crossing
    let index = -1;
    let data;
    try {
      data = store.readQuery({ query: allCrossings, variables: qvars });
      index = data.searchCrossings.nodes.findIndex(
        node => node.id === updatedCrossing.id,
      );
    } catch (err) {
      logError(err);
      return;
    }

    // Remove it if it's on a layer already
    if (index !== -1) {
      data.searchCrossings.nodes.splice(index, 1);
    }

    // Add it to a layer if appropriate
    if (
      (qvars.showOpen &&
        updatedCrossing.latestStatusId === statusConstants.OPEN) ||
      (qvars.showCaution &&
        updatedCrossing.latestStatusId === statusConstants.CAUTION) ||
      (qvars.showClosed &&
        updatedCrossing.latestStatusId === statusConstants.CLOSED) ||
      (qvars.showLongterm &&
        updatedCrossing.latestStatusId === statusConstants.LONGTERM)
    ) {
      data.searchCrossings.nodes.push({
        id: updatedCrossing.id,
        geojson: updatedCrossing.geojson,
        latestStatusId: updatedCrossing.latestStatusId,
        communityIds: updatedCrossing.communityIds,
        name: updatedCrossing.name,
        latestStatusCreatedAt: updatedCrossing.latestStatusCreatedAt,
        __typename: 'Crossing',
      });
    }

    // write it to the apollo cache
    store.writeQuery({
      query: allCrossings,
      variables: qvars,
      data,
    });
  }

  newStatusUpdate = e => {
    const updateData = {
      id: Math.round(Math.random() * -1000000),
      crossingId: this.props.crossing.id,
      name: this.props.crossing.name,
      geojson: this.props.crossing.geojson,
      communityIds: this.props.crossing.communityIds,
      statusId: this.state.selectedStatus,
      reasonId: this.state.selectedReason,
      reopenDate: this.state.selectedReopenDate,
      indefiniteClosure: this.state.selectedIndefiniteClosure,
      notes: this.state.notes,
      user: this.props.currentUser,
    };
    const { refreshList, clearMeasurerCache } = this.props;

    const queriesToRefetch =
      this.props.listOrMap === 'map'
        ? [
            { query: statusCountsQuery },
            {
              query: crossingsQuery,
              variables: {
                orderAsc: false,
                pageCursor: null,
                search: '%%',
                showCaution: true,
                showClosed: true,
                showLongterm: true,
                showOpen: true,
              },
            },
          ]
        : [
            { query: statusCountsQuery },
            { query: allCrossings, variables: { statusId: 1 } },
            { query: allCrossings, variables: { statusId: 2 } },
            { query: allCrossings, variables: { statusId: 3 } },
            { query: allCrossings, variables: { statusId: 4 } },
          ];

    this.props
      .newStatusUpdateMutation({
        variables: {
          crossingId: updateData.crossingId,
          statusId: updateData.statusId,
          reasonId: updateData.reasonId,
          reopenDate: updateData.reopenDate,
          indefiniteClosure: updateData.indefiniteClosure,
          notes: updateData.notes,
        },
        optimisticResponse: {
          newStatusUpdate: {
            statusUpdate: {
              crossingId: updateData.crossingId,
              crossingByCrossingId: {
                id: updateData.crossingId,
                geojson: updateData.geojson,
                latestStatusId: updateData.statusId,
                communityIds: updateData.communityIds,
                latestStatusUpdateId: updateData.id,
                latestStatusCreatedAt: moment().format(),
                name: updateData.name,
                statusUpdateByLatestStatusUpdateId: {
                  id: updateData.id,
                  crossingId: updateData.crossingId,
                  statusId: updateData.statusId,
                  statusReasonId: updateData.reasonId,
                  reopenDate: updateData.reopenDate,
                  indefiniteClosure: updateData.indefiniteClosure,
                  createdAt: moment().format(),
                  notes: updateData.notes,
                  userByCreatorId: {
                    firstName: updateData.user.firstName,
                    lastName: updateData.user.lastName,
                    __typename: 'User',
                  },
                  __typename: 'StatusUpdate',
                },
                __typename: 'Crossing',
              },
              __typename: 'StatusUpdate',
            },
            __typename: 'NewStatusUpdatePayload',
          },
        },
        update: (store, { data: { newStatusUpdate } }) => {
          // Get the updated crossing from the status update mutation
          const updatedCrossing =
            newStatusUpdate.statusUpdate.crossingByCrossingId;

          // Write the updated crossing to the cache
          store.writeFragment({
            id: `Crossing:${updatedCrossing.id}`,
            fragment: statusUpdateFragment,
            data: updatedCrossing,
          });

          // If we're in a list view, fix the sort order
          // Map queries must also be updated, even if change took place on list page.
          if (this.props.listOrMap === 'list') {
            this.fixSort(store, updatedCrossing);
            this.updateMap(store, updatedCrossing);
          }

          // If we're on the map, update the map queries
          if (this.props.listOrMap === 'map') {
            this.updateMap(store, updatedCrossing);
          }
        },
        refetchQueries: queriesToRefetch,
      })
      .then(({ data }) => {
        const update =
          data.newStatusUpdate.statusUpdate.crossingByCrossingId
            .statusUpdateByLatestStatusUpdateId;

        this.setState({
          selectedStatus: update.statusId,
          selectedReason: update.statusReasonId,
          selectedReopenDate: update.reopenDate,
          selectedIndefiniteClosure: update.indefiniteClosure,
          notes: update.notes,
        });
        if (clearMeasurerCache) {
          clearMeasurerCache(true);
          refreshList();
        }
      })
      .catch(error => {
        logError(error);
      });
  };

  activateOpenToggle = () => {
    this.setState({
      selectedStatus: statusConstants.OPEN,
      notes: '',
      selectedReason: null,
      selectedReopenDate: null,
      selectedIndefiniteClosure: false,
    });
    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  activateCautionToggle = () => {
    this.setState({
      selectedStatus: statusConstants.CAUTION,
      notes: '',
      selectedReason: this.props.reasons.find(
        reason => reason.statusId === statusConstants.CAUTION,
      ).id,
      selectedReopenDate: null,
      selectedIndefiniteClosure: false,
    });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  activateClosedToggle = () => {
    this.setState({
      selectedStatus: statusConstants.CLOSED,
      notes: '',
      selectedReason: this.props.reasons.find(
        reason => reason.statusId === statusConstants.CLOSED,
      ).id,
      selectedReopenDate: null,
      selectedIndefiniteClosure: false,
    });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  activateLongtermToggle = () => {
    this.setState({
      selectedStatus: statusConstants.LONGTERM,
      notes: '',
      selectedReason: this.props.reasons.find(
        reason => reason.statusId === statusConstants.LONGTERM,
      ).id,
      selectedReopenDate: this.props.crossing.statusUpdateByLatestStatusUpdateId
        .reopenDate,
      selectedIndefiniteClosure: this.props.crossing.statusUpdateByLatestStatusUpdateId
        .indefiniteClosure,
    });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  reasonChanged = e => {
    this.setState({ selectedReason: e.target.value });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  durationChanged = ({indefiniteClosure, reopenDate}) => {
    this.setState({ selectedReopenDate: reopenDate });
    this.setState({ selectedIndefiniteClosure: indefiniteClosure });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  notesChanged = e => {
    this.setState({ notes: e.target.value });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  cancelClicked = () => {
    this.setState({
      selectedStatus: this.props.crossing.statusUpdateByLatestStatusUpdateId
        .statusId,
      selectedReason: this.props.crossing.statusUpdateByLatestStatusUpdateId
        .statusReasonId,
      selectedReopenDate: this.props.crossing.statusUpdateByLatestStatusUpdateId
        .reopenDate,
      selectedIndefiniteClosure : this.props.crossing.statusUpdateByLatestStatusUpdateId
        .indefiniteClosure,
      notes: this.props.crossing.statusUpdateByLatestStatusUpdateId.notes,
    });

    if (this.props.clearMeasurerCache) {
      this.props.clearMeasurerCache();
    }
  };

  isDirty() {
    // Temporary fix for storybook
    if (this.props.dirty) return true;

    const savedStatus = this.props.crossing.statusUpdateByLatestStatusUpdateId
      .statusId;
    const savedReason = this.props.crossing.statusUpdateByLatestStatusUpdateId
      .statusReasonId;
    const savedOpenDate = this.props.crossing.statusUpdateByLatestStatusUpdateId
      .reopenDate;
    const savedIndefiniteClosure = this.props.crossing.statusUpdateByLatestStatusUpdateId
      .indefiniteClosure;
    const savedNotes = this.props.crossing.statusUpdateByLatestStatusUpdateId
      .notes;

    return (
      savedStatus !== this.state.selectedStatus ||
      savedReason !== this.state.selectedReason ||
      savedOpenDate !== this.state.selectedReopenDate ||
      savedIndefiniteClosure !== this.state.selectedIndefiniteClosure ||
      savedNotes !== this.state.notes
    );
  }

  render() {
    const { crossing, allCommunities } = this.props;

    let {reasons} = this.props;
    reasons = reasons.filter(
      reason => reason.statusId === this.state.selectedStatus
    )

    const {
      createdAt,
      userByCreatorId,
    } = crossing.statusUpdateByLatestStatusUpdateId;

    var show = [];
    switch (this.state.selectedStatus) {
      case statusConstants.OPEN:
        show = this.isDirty() ? ['cancelSave'] : [];
        break;
      case statusConstants.CAUTION:
      case statusConstants.CLOSED:
        show = this.isDirty() ? ['reason', 'cancelSave'] : ['reason'];
        break;
      case statusConstants.LONGTERM:
        show = this.isDirty()
          ? ['reason', 'duration', 'cancelSave']
          : ['reason', 'duration'];
        break;
      default:
        break;
    }

    const CrossingListItemJSX = (
      <div
        className={`DashboardCrossingListItem DashboardCrossingListItem--layout-${
          this.props.listOrMap
        }`}
      >
        <div className="DashboardCrossingListItem__overview">
          <div className="DashboardCrossingListItem__crossing-name">
            <a href={`/dashboard/crossing/${crossing.id}`}>{crossing.name}</a>
          </div>
          <div className="DashboardCrossingListItem__overview-details">
            <div className="DashboardCrossingListItem__overview-location">
              <Location crossing={crossing} />
              <div className="DashboardCrossingListItem__community-list">
                <CrossingCommunityList
                  crossing={crossing}
                  allCommunities={allCommunities}
                  onDash={this.props.onDash}
                />
              </div>
            </div>
            <div className="DashboardCrossingListItem__overview-meta">
              <div>
                <Date date={createdAt} />
              </div>
              <div>
                <Hour date={createdAt} />
              </div>
              <div className="DashboardCrossingListItem__user">
                <User user={userByCreatorId} />
              </div>
            </div>
          </div>
        </div>
        <div className="DashboardCrossingListItem__controls">
          <DashboardCrossingListItemControl
            label={
              <div>
                Status: {statusConstants.statusNames[this.state.selectedStatus]}
              </div>
            }
            className="DashboardCrossingListItem__control--status"
          >
            <StatusToggle
              activeStatus={this.state.selectedStatus}
              activateOpenToggle={this.activateOpenToggle}
              activateCautionToggle={this.activateCautionToggle}
              activateClosedToggle={this.activateClosedToggle}
              activateLongtermToggle={this.activateLongtermToggle}
            />
          </DashboardCrossingListItemControl>

          {show.includes('reason') && (
            <DashboardCrossingListItemControl
              label="Reason"
              isRequired={this.isDirty()}
            >
            {(reasons.length > 1) ? (
              <Dropdown
                options={reasons}
                selected={this.state.selectedReason}
                onChange={this.reasonChanged}
              />
            ) : (
              <SingleOptionDropdown
                option={reasons[0].name}
              />
            )}
            </DashboardCrossingListItemControl>
          )}
          <DashboardCrossingListItemControl label="Notes to the public">
            <input
              className="DashboardCrossingListItem__notes-text-box"
              type="text"
              value={this.state.notes}
              onChange={this.notesChanged}
            />
          </DashboardCrossingListItemControl>
          {show.includes('duration') && (
            <DashboardCrossingListItemControl
              label="Duration"
              isRequired={this.isDirty()}
            >
              <DatePicker
                reopenDate={this.state.selectedReopenDate}
                indefiniteClosure={this.state.selectedIndefiniteClosure}
                onChange={this.durationChanged}
              />
            </DashboardCrossingListItemControl>
          )}
        </div>
        {show.includes('cancelSave') && (
          <div className="DashboardCrossingListItem__button-container">
            <ButtonSecondary
              className="DashboardCrossingListItem__cancel-button"
              onClick={this.cancelClicked}
            >
              Cancel
            </ButtonSecondary>
            <ButtonPrimary
              className="DashboardCrossingListItem__save-button"
              onClick={this.newStatusUpdate}
            >
              Submit
            </ButtonPrimary>
          </div>
        )}
      </div>
    );

    if (!this.props.cqClassName) {
      return (
        <ContainerQuery query={containerQuery}>
          {params => (
            <div
              className={classnames(params, {
                'DashboardCrossingListItem--dirty': this.isDirty(),
              })}
            >
              {CrossingListItemJSX}
            </div>
          )}
        </ContainerQuery>
      );
    }

    return (
      <div
        className={classnames(this.props.cqClassName, {
          'DashboardCrossingListItem--dirty': this.isDirty(),
        })}
      >
        {CrossingListItemJSX}
      </div>
    );
  }
}

export default graphql(newStatusUpdateMutation, {
  name: 'newStatusUpdateMutation',
})(DashboardCrossingListItem);
