import React from 'react';
import { graphql } from 'react-apollo';
import Location from 'components/Dashboard/CrossingListPage/CrossingListItem/Location';
import DateTime from 'components/Dashboard/CrossingListPage/CrossingListItem/DateTime';
import StatusToggle from 'components/Dashboard/CrossingListPage/CrossingListItem/StatusToggle';
import Dropdown from 'components/Dashboard/CrossingListPage/CrossingListItem/Dropdown';
import 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem.css';
import * as statusConstants from 'components/Dashboard/CrossingListPage/CrossingListItem/StatusConstants';
import newStatusUpdateMutation from 'components/Dashboard/CrossingListPage/queries/newStatusUpdateMutation';
import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';
import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';
import { invalidateFields, ROOT } from 'apollo-cache-invalidation';

const containerQuery = {
  'CrossingListItem--lg': {
    minWidth: 600,
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

    this.openClicked = this.openClicked.bind(this);
    this.closedClicked = this.closedClicked.bind(this);
    this.cautionClicked = this.cautionClicked.bind(this);
    this.longtermClicked = this.longtermClicked.bind(this);
    this.cancelClicked = this.cancelClicked.bind(this);
    this.reasonChanged = this.reasonChanged.bind(this);
    this.durationChanged = this.durationChanged.bind(this);
    this.notesChanged = this.notesChanged.bind(this);
    this.newStatusUpdate = this.newStatusUpdate.bind(this);
  }

  fixSorty(store, updatedCrossing) {
    // Get the edge from the current query
    const { crossingQueryVariables } = this.props;
    const data = store.readQuery({ query: crossingsQuery, variables: crossingQueryVariables });
    const edge = data.searchCrossings.edges.find(edge => edge.node.id == updatedCrossing.id);

    // Get all the queries we have cached
    const queries = store.data.ROOT_QUERY;
    const queryVariables = Object.keys(queries)
                            .filter(query => query.includes('searchCrossings'))
                            .map(q => JSON.parse(q.replace(/.*\(|\)/g, '')));

    // var x = store.readQuery({ query: crossingsQuery, variables: queryVariables[0] });
    debugger;

    // Update the sorting accordingly
    for(var qv of queryVariables) {
      const qvars = {
        orderAsc: qv.orderAsc,
        pageCursor: null,
        search: qv.search,
        showCaution: qv.showCaution,
        showClosed: qv.showClosed,
        showLongterm: qv.showLongterm,
        showOpen: qv.showOpen
      };
      
      this.doASortFix(store, updatedCrossing, qvars, edge);
    }
  }

  doASortFix(store, updatedCrossing, queryVariables, edge) {
    // Get the index of the updated crossing
    let index = -1;
    let data;
    try {
      data = store.readQuery({ query: crossingsQuery, variables: queryVariables });
      index = data.searchCrossings.edges.findIndex(edge => edge.node.id == updatedCrossing.id);
      
    } catch(err) {
      console.log(err);
    }

    // Remove it if it's on a list already
    if (index != -1) {
      data.searchCrossings.edges.splice(index, 1);
    }

    // Add it to a list if appropriate
    if ((queryVariables.showOpen && updatedCrossing.latestStatusId == statusConstants.OPEN) ||
        (queryVariables.showCaution && updatedCrossing.latestStatusId == statusConstants.CAUTION) ||
        (queryVariables.showClosed && updatedCrossing.latestStatusId == statusConstants.CLOSED) ||
        (queryVariables.showLongterm && updatedCrossing.latestStatusId == statusConstants.LONGTERM)) {
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
      data
    });

    debugger;
  }

  // fixSort(store, updatedCrossing) {
  //   const { crossingQueryVariables } = this.props;

  //   const crossingQueryVariablesAsc = Object.assign({}, crossingQueryVariables);
  //   const crossingQueryVariablesDesc = Object.assign({}, crossingQueryVariables);
  //   crossingQueryVariablesAsc.orderAsc = true;
  //   crossingQueryVariablesDesc.orderAsc = false;
  //   const crossingQueryVariablesNoSearchDesc = {
  //     orderAsc: false,
  //     pageCursor: null,
  //     search: "%%",
  //     showCaution: true,
  //     showClosed: true,
  //     showLongterm: true,
  //     showOpen: true
  //   }

  //   // Get the index of the updated crossing
  //   let indexDesc = -1;
  //   let dataDesc;
  //   try {
  //     dataDesc = store.readQuery({ query: crossingsQuery, variables: crossingQueryVariablesDesc });
  //     indexDesc = dataDesc.searchCrossings.edges.findIndex(edge => edge.node.id == updatedCrossing.id);
      
  //   } catch(err) {
  //     console.log(err);
  //   }

  //   let indexNoSearchDesc = -1;
  //   let dataNoSearchDesc;
  //   try {
  //     dataNoSearchDesc = store.readQuery({ query: crossingsQuery, variables: crossingQueryVariablesNoSearchDesc });
  //     indexNoSearchDesc = dataNoSearchDesc.searchCrossings.edges.findIndex(edge => edge.node.id == updatedCrossing.id);
      
  //   } catch(err) {
  //     console.log(err);
  //   }

  //   let indexAsc = -1;
  //   let dataAsc;
  //   try {
  //     dataAsc = store.readQuery({ query: crossingsQuery, variables: crossingQueryVariablesAsc });
  //     indexAsc = dataAsc.searchCrossings.edges.findIndex(edge => edge.node.id == updatedCrossing.id);          
  //   } catch(err) {
  //     console.log(err);
  //   }
    
  //   // Get the crossing edge
  //   let edge;
  //   if (indexDesc != -1) {
  //     edge = dataDesc.searchCrossings.edges.find(edge => edge.node.id == updatedCrossing.id);
  //     dataDesc.searchCrossings.edges.splice(indexDesc, 1);
  //   }

  //   if (indexAsc != -1) {
  //     edge = dataAsc.searchCrossings.edges.find(edge => edge.node.id == updatedCrossing.id);
  //     dataAsc.searchCrossings.edges.splice(indexAsc, 1);
  //   }

  //   // If it's already on the no search list we need to remove it before re-adding it
  //   if (indexNoSearchDesc != -1) {
  //     dataNoSearchDesc.searchCrossings.edges.splice(indexNoSearchDesc, 1);
  //   }
    
  //   // Put it at the top of the current list
  //   if ((crossingQueryVariables.showOpen && updatedCrossing.latestStatusId == statusConstants.OPEN) ||
  //       (crossingQueryVariables.showCaution && updatedCrossing.latestStatusId == statusConstants.CAUTION) ||
  //       (crossingQueryVariables.showClosed && updatedCrossing.latestStatusId == statusConstants.CLOSED) ||
  //       (crossingQueryVariables.showLongterm && updatedCrossing.latestStatusId == statusConstants.LONGTERM)) {
  //     dataDesc.searchCrossings.edges.splice(0, 0, edge);  
  //   }

  //   // Put it at the top of the main list
  //   dataNoSearchDesc.searchCrossings.edges.splice(0, 0, edge);

  //   store.writeQuery({
  //     query: crossingsQuery,
  //     variables: crossingQueryVariablesDesc,
  //     data: dataDesc
  //   });

  //   store.writeQuery({
  //     query: crossingsQuery,
  //     variables: crossingQueryVariablesNoSearchDesc,
  //     data: dataNoSearchDesc
  //   });

  //   if (dataAsc) {
  //     store.writeQuery({
  //       query: crossingsQuery,
  //       variables: crossingQueryVariablesAsc,
  //       data: dataAsc
  //     });
  //   }
  // }

  newStatusUpdate(e) {
    const updateData = {
      id: Math.round(Math.random() * -1000000),
      crossingId: this.props.crossing.id,
      statusId: this.state.selectedStatus,
      reasonId: (this.state.selectedStatus !== statusConstants.OPEN ? this.state.selectedReason : null),
      durationId: (this.state.selectedStatus === statusConstants.LONGTERM ? this.state.selectedDuration : null),
      notes: this.state.notes,
      user: this.props.currentUser
    };
    const { refreshList, clearMeasurerCache } = this.props;

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
              latestStatusCreatedAt: Date.now(),
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
      // update: invalidateFields((proxy, result) => [
      //   [ROOT, 'searchCrossings']
      // ])
      update: (store, {data: {newStatusUpdate}}) => {
        // Get the updated crossing from the status update mutation
        const updatedCrossing = newStatusUpdate.statusUpdate.crossingByCrossingId;

        // Write the updated crossing to the cache
        store.writeFragment({
          id: 'Crossing:' + updatedCrossing.id,
          fragment: crossingFragment,
          data: updatedCrossing
        });

        // Fix the sort order
        this.fixSorty(store, updatedCrossing);
        debugger;
      },
      refetchQueries: [{query: statusCountsQuery}]
    })
    .then(({ data }) => {
      const update = data.newStatusUpdate.statusUpdate.crossingByCrossingId.statusUpdateByLatestStatusUpdateId;

      this.setState({ selectedStatus: update.statusId });
      this.setState({ selectedReason: update.statusReasonId });
      this.setState({ selectedDuration: update.statusDurationId });
      this.setState({ notes: update.notes });
      clearMeasurerCache(true);
      refreshList();
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

    return (savedStatus !== this.state.selectedStatus ||
            savedReason !== this.state.selectedReason ||
            savedDuration !== this.state.selectedDuration ||
            savedNotes !== this.state.notes);
  }

  openClicked() {
    this.setState({ selectedStatus: statusConstants.OPEN });
    this.setState({ notes: '' });
    this.setState({ selectedReason: null });
    this.setState({ selectedDuration: null });
    this.props.clearMeasurerCache();
  };
  cautionClicked() {
    this.setState({ selectedStatus: statusConstants.CAUTION });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CAUTION).id });
    this.setState({ selectedDuration: null });
    this.props.clearMeasurerCache();
  };
  closedClicked() {
    this.setState({ selectedStatus: statusConstants.CLOSED });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.CLOSED).id });
    this.setState({ selectedDuration: null });
    this.props.clearMeasurerCache();
  };
  longtermClicked() {
    this.setState({ selectedStatus: statusConstants.LONGTERM });
    this.setState({ notes: '' });
    this.setState({ selectedReason: this.props.reasons.find(reason => reason.statusId === statusConstants.LONGTERM).id });
    this.setState({ selectedDuration: this.props.durations[0].id });
    this.props.clearMeasurerCache();
  };

  reasonChanged(e) {
    this.setState({ selectedReason: e.target.value });
    this.props.clearMeasurerCache();
  };
  durationChanged(e) {
    this.setState({ selectedDuration: e.target.value });
    this.props.clearMeasurerCache();
  };
  notesChanged(e) {
    this.setState({ notes: e.target.value });
    this.props.clearMeasurerCache();
  };

  cancelClicked() {
    this.setState({ selectedStatus: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusId });
    this.setState({ selectedReason: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusReasonId });
    this.setState({ selectedDuration: this.props.crossing.statusUpdateByLatestStatusUpdateId.statusDurationId });
    this.setState({ notes: this.props.crossing.statusUpdateByLatestStatusUpdateId.notes });
    this.props.clearMeasurerCache();
  };

  render () {
    const { crossing, reasons, durations } = this.props;

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
            <DateTime update={ crossing.statusUpdateByLatestStatusUpdateId } />
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
