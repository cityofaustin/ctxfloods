import React from 'react';
import FontAwesome from 'react-fontawesome';
import { graphql } from 'react-apollo';
import Location from './Location';
import DateTime from './DateTime';
import StatusToggle from './StatusToggle';
import Dropdown from './Dropdown';
import './CrossingListItem.css';
import * as statusConstants from './StatusConstants';
import newStatusUpdateMutation from '../queries/newStatusUpdateMutation';
import crossingsQuery from '../queries/crossingsQuery';
import statusCountsQuery from '../queries/statusCountsQuery';
import crossingFragment from '../queries/crossingFragment';

const statusStrings = new Map();
statusStrings.set(statusConstants.OPEN, 'Open');
statusStrings.set(statusConstants.CAUTION, 'Caution');
statusStrings.set(statusConstants.CLOSED, 'Closed');
statusStrings.set(statusConstants.LONGTERM, 'Long Term Closure');

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

  newStatusUpdate(e) {
    const updateData = {
      id: Math.round(Math.random() * -1000000),
      crossingId: this.props.crossing.id,
      statusId: this.state.selectedStatus,
      reasonId: (this.state.selectedStatus !== statusConstants.OPEN ? this.state.selectedReason : null),
      durationId: (this.state.selectedStatus === statusConstants.LONGTERM ? this.state.selectedDuration : null),
      notes: this.state.notes
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
                  firstName: "blarg",
                  lastName: "blarg",
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
          id: 'Crossing:' + updatedCrossing.id,
          fragment: crossingFragment,
          data: updatedCrossing
        });
      },
      refetchQueries: [{query: statusCountsQuery}]
    })
    .then(({ data }) => {
      const update = data.newStatusUpdate.statusUpdate.crossingByCrossingId.statusUpdateByLatestStatusUpdateId;

      this.setState({ selectedStatus: update.statusId });
      this.setState({ selectedReason: update.statusReasonId });
      this.setState({ selectedDuration: update.statusDurationId });
      this.setState({ notes: update.notes });
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  isDirty() {
    // Temporary fix for storybook
    if(this.props.dirty) return true;

    const savedStatus = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusId;
    const savedReason = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId;
    const savedDuration = this.props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId;
    const savedNotes = this.props.crossing.statusUpdateByLatestStatusUpdateId.notes;

    return (savedStatus != this.state.selectedStatus ||
            savedReason != this.state.selectedReason ||
            savedDuration != this.state.selectedDuration ||
            savedNotes != this.state.notes);
  }

  openClicked = () => { 
    this.setState({ selectedStatus: statusConstants.OPEN });
    this.setState({ notes: '' });
    this.setState({ selectedReason: null });
    this.setState({ selectedDuration: null });
  };
  cautionClicked = () => {
    this.setState({ selectedStatus: statusConstants.CAUTION });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CAUTION).id });
    this.setState({ selectedDuration: null });
  };
  closedClicked = () => { 
    this.setState({ selectedStatus: statusConstants.CLOSED });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CLOSED).id });
    this.setState({ selectedDuration: null });
  };
  longtermClicked = () => {
    this.setState({ selectedStatus: statusConstants.LONGTERM });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.LONGTERM).id });
    this.setState({ selectedDuration: this.props.durations[0].id });
  };

  reasonChanged = (e) => { this.setState({ selectedReason: e.target.value }) };
  durationChanged = (e) => { this.setState({ selectedDuration: e.target.value }) };
  notesChanged = (e) => { this.setState({ notes: e.target.value }) };

  cancelClicked = () => { 
    this.setState({ selectedStatus: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusId });
    this.setState({ selectedReason: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId });
    this.setState({ selectedDuration: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId });
    this.setState({ notes: this.props.crossing.statusUpdateByLatestStatusUpdateId.notes });
  };

  render () {
    const { crossing, reasons, durations, hidden } = this.props;

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
    }

    return (
      <div>
        <div className="CrossingListItemContainer">
          <div className={this.isDirty() ? "DirtyBorder" : ""}>
          <div className="CrossingListItemFlexContainer">
            <div className="CrossingName">{crossing.name}</div>
            <Location crossing={ crossing } />
            <DateTime update={ crossing.statusUpdateByLatestStatusUpdateId } />
          </div>
          <div className="CrossingListItemFlexContainer">
            <div className="flexitem">
              <div className="ControlLabel">Status: {statusStrings.get(this.state.selectedStatus)}</div>
              <StatusToggle 
                status={this.state.selectedStatus}
                openClicked={this.openClicked}
                cautionClicked={this.cautionClicked}
                closedClicked={this.closedClicked}
                longtermClicked={this.longtermClicked} />
            </div>
            <div className="flexitem">
              <div className={show.includes('reason') ? "" : "hidden"}>
                <div className="ControlLabelContainer">
                  <div className="ControlLabel">Reason</div>
                  <div className="required">{this.isDirty() ? "Required" : ""}</div>
                </div>
                <Dropdown
                  options={reasons.filter(reason => reason.statusId === this.state.selectedStatus)}
                  selected={this.state.selectedReason}
                  onChange={this.reasonChanged} />
              </div>
            </div>
            <div className="flexitem">
              <div className="ControlLabel">Notes to the public</div>
              <input className="NotesTextBox" type="text" value={this.state.notes} onChange={this.notesChanged}/>
            </div>
          </div>
          <div className={show.includes('duration') || show.includes('cancelSave') ? "CrossingListItemFlexContainer" : ""}>
            <div className="flexitem" />
            <div className="flexitem">
              <div className={show.includes('duration') ? "" : "hidden"}>
                <div className="ControlLabelContainer">
                  <div className="ControlLabel">Duration</div>
                  <div className="required">{this.isDirty() ? "Required" : ""}</div>
                </div>
                <Dropdown
                  options={durations}
                  selected={this.state.selectedDuration}
                  onChange={this.durationChanged} />
              </div>
            </div>
            <div className="flexitem">
              <div className={show.includes('cancelSave') ? "" : "hidden"}>
                <div className="flexcontainer">              
                  <div className="CancelButton" onClick={this.cancelClicked}>Cancel</div>
                  <div className="SaveButton" onClick={this.newStatusUpdate.bind(this)}>Save</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    );
  }
}

export default graphql(newStatusUpdateMutation, { name: 'newStatusUpdateMutation' })(CrossingListItem);
