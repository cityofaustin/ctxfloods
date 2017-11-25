import React from 'react';
import { graphql } from 'react-apollo';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';
import Location from 'components/Dashboard/CrossingListPage/CrossingListItem/Location';
import DateTime from 'components/Dashboard/CrossingListPage/CrossingListItem/DateTime';
import StatusToggle from 'components/Dashboard/CrossingListPage/CrossingListItem/StatusToggle';
import Dropdown from 'components/Dashboard/CrossingListPage/CrossingListItem/Dropdown';
import newStatusUpdateMutation from 'components/Dashboard/CrossingListPage/queries/newStatusUpdateMutation';
import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import statusUpdateFragment from 'components/Dashboard/CrossingListPage/queries/statusUpdateFragment';
import * as statusConstants from 'constants/StatusConstants';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem.css';


const containerQuery = {
  'CrossingListItem--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  }
};

class CrossingListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedStatus: props.crossing.statusUpdateByLatestStatusUpdateId.statusId,
      selectedReason: props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
      selectedDuration: props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId,
      notes: props.crossing.statusUpdateByLatestStatusUpdateId.notes
    };
  }

  newStatusUpdate = (e) => {
    const updateData = {
      id: Math.round(Math.random() * -1000000),
      crossingId: this.props.crossing.id,
      statusId: this.state.selectedStatus,
      reasonId: this.state.selectedReason,
      durationId: this.state.selectedDuration,
      notes: this.state.notes,
      user: this.props.currentUser
    }

    this.props.newStatusUpdateMutation({
      variables: {
        crossingId: updateData.crossingId,
        statusId: updateData.statusId,
        reasonId: updateData.reasonId,
        durationId: updateData.durationId,
        notes: updateData.notes
      },
      optimisticResponse: {
        newStatusUpdate: {
          statusUpdate: {
            crossingId: updateData.crossingId,
            crossingByCrossingId: {
              id: updateData.crossingId,
              latestStatusId: updateData.statusId,
              latestStatusUpdateId: updateData.id,
              statusUpdateByLatestStatusUpdateId: {
                id: updateData.id,
                crossingId: updateData.crossingId,
                statusId: updateData.statusId,
                statusReasonId: updateData.reasonId,
                statusDurationId: updateData.durationId,
                createdAt: Date.now(),
                notes: updateData.notes,
                userByCreatorId: {
                  firstName: updateData.user.firstName,
                  lastName: updateData.user.lastName,
                  __typename: "User"
                },
                __typename: "StatusUpdate"
              },
              __typename: "Crossing"
            },
            __typename: "StatusUpdate"
          },
          __typename: "NewStatusUpdatePayload"
        },
      },
      update: (store, {data: {newStatusUpdate}}) => {
        // Get the updated crossing from the status update mutation
        const updatedCrossing = newStatusUpdate.statusUpdate.crossingByCrossingId;

        // Write the updated crossing to the cache
        store.writeFragment({
          id: `Crossing:${updatedCrossing.id}`,
          fragment: statusUpdateFragment,
          data: updatedCrossing
        });
      },
      refetchQueries: [{query: statusCountsQuery}]
    })
    .then(({ data }) => {
      const update = data.newStatusUpdate.statusUpdate.crossingByCrossingId.statusUpdateByLatestStatusUpdateId;

      this.setState({ 
        selectedStatus: update.statusId,
        selectedReason: update.statusReasonId,
        selectedDuration: update.statusDurationId,
        notes: update.notes 
      });
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  openClicked = () => {
    this.setState({ 
      selectedStatus: statusConstants.OPEN,
      notes: '',
      selectedReason: null,
      selectedDuration: null 
    });
  };
  cautionClicked = () => {
    this.setState({ 
      selectedStatus: statusConstants.CAUTION,
      notes: '',
      selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CAUTION).id,
      selectedDuration: null
    });
  };
  closedClicked = () => {
    this.setState({ 
      selectedStatus: statusConstants.CLOSED,
      notes: '',
      selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CLOSED).id,
      selectedDuration: null
    });
  };
  longtermClicked = () => {
    this.setState({ 
      selectedStatus: statusConstants.LONGTERM,
      notes: '',
      selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.LONGTERM).id,
      selectedDuration: this.props.durations[0].id
    });
  };

  reasonChanged = (e) => { this.setState({ selectedReason: e.target.value }) };
  durationChanged = (e) => { this.setState({ selectedDuration: e.target.value }) };
  notesChanged = (e) => { this.setState({ notes: e.target.value }) };

  cancelClicked = () => {
    this.setState({ 
      selectedStatus: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusId,
      selectedReason: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
      selectedDuration: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId,
      notes: this.props.crossing.statusUpdateByLatestStatusUpdateId.notes 
    });
  };

  isDirty() {
    // Temporary fix for storybook
    if(this.props.dirty) return true;

    const savedStatus = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusId;
    const savedReason = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId;
    const savedDuration = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId;
    const savedNotes = this.props.crossing.statusUpdateByLatestStatusUpdateId.notes;

    return (savedStatus !== this.state.selectedStatus ||
            savedReason !== this.state.selectedReason ||
            savedDuration !== this.state.selectedDuration ||
            savedNotes !== this.state.notes);
  }

  render () {
    const { crossing, reasons, durations, hidden } = this.props;
    const { createdAt, userByCreatorId } = crossing.statusUpdateByLatestStatusUpdateId;

    if (hidden) return '';

    var show = [];
    switch(this.state.selectedStatus) {
      case statusConstants.OPEN:
        show = this.isDirty() ? ['cancelSave'] : [];
        break;
      case statusConstants.CAUTION:
      case statusConstants.CLOSED:
        show = this.isDirty() ? ['reason', 'cancelSave'] : ['reason'];
        break;
      case statusConstants.LONGTERM:
        show = this.isDirty() ? ['reason', 'duration', 'cancelSave'] : ['reason', 'duration'];
        break;
      default:
        break;
    }

    const CrossingListItemJSX = (
      <div>
        <div className="CrossingListItemFlexContainer">
          <div className="CrossingListItemFlexItem">
            <a href={`/dashboard/crossing/${crossing.id}`} className="CrossingName">{crossing.name}</a>
          </div>
          <div className="CrossingListItemFlexItem">
            <Location crossing={ crossing } />
          </div>
          <div className="CrossingListItemFlexItem">
            <DateTime datetime={ createdAt } user={ userByCreatorId } />
          </div>
        </div>
        <div className="CrossingListItemFlexContainer">
          <div className="CrossingListItemFlexItem">
          <div className="ControlLabel">Status: {statusConstants.strings[this.state.selectedStatus]}</div>
            <StatusToggle
              status={this.state.selectedStatus}
              openClicked={this.openClicked}
              cautionClicked={this.cautionClicked}
              closedClicked={this.closedClicked}
              longtermClicked={this.longtermClicked} />
          </div>

        {show.includes('reason') ? (
          <div className="CrossingListItemFlexItem">
            <div className="ControlLabelContainer">
              <div className="ControlLabel">Reason</div>
              <div className="required">{this.isDirty() ? "Required" : ""}</div>
            </div>
            <Dropdown
              options={reasons.filter(reason => reason.statusId === this.state.selectedStatus)}
              selected={this.state.selectedReason}
              onChange={this.reasonChanged} />
          </div>
        ) : (
          <div className="CrossingListItemFlexItem--spacer" />
        )}
          <div className="CrossingListItemFlexItem">
            <div className="ControlLabel">Notes to the public</div>
            <input className="NotesTextBox" type="text" value={this.state.notes} onChange={this.notesChanged}/>
          </div>
        </div>

        { (show.includes('duration') || show.includes('cancelSave')) && (

        <div className="CrossingListItemFlexContainer">
          <div className="CrossingListItemFlexItem--spacer" />

        {show.includes('duration') ? (
          <div className="CrossingListItemFlexItem">
            <div className="ControlLabelContainer">
              <div className="ControlLabel">Duration</div>
              <div className="required">{this.isDirty() ? "Required" : ""}</div>
            </div>
            <Dropdown
              options={durations}
              selected={this.state.selectedDuration}
              onChange={this.durationChanged} />
          </div>
        ) : (
          <div className="CrossingListItemFlexItem--spacer" />
        )}

        {show.includes('cancelSave') ? (
          <div className="CrossingListItemFlexItem">
            <div className="ButtonContainer">
              <div className="CancelButton" onClick={this.cancelClicked}>Cancel</div>
              <div className="SaveButton" onClick={this.newStatusUpdate}>Save</div>
            </div>
          </div>
        ) : (
          <div className="CrossingListItemFlexItem--spacer" />
        )}

        </div>
        )}

      </div>
    );

    if(!this.props.cqClassName) {
      return (
        <ContainerQuery query={containerQuery}>
        {(params) => (
          <div className={classnames(params, {"CrossingListItem--dirty": this.isDirty()}, "CrossingListItem")}>
            {CrossingListItemJSX}
          </div>
        )}
        </ContainerQuery>
      );
    }

    return (
      <div className={classnames(this.props.cqClassName, {"CrossingListItem--dirty": this.isDirty()}, "CrossingListItem")}>
        {CrossingListItemJSX}
      </div>
    );
  }
}

export default graphql(newStatusUpdateMutation, { name: 'newStatusUpdateMutation' })(CrossingListItem);
