import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import moment from 'moment';

import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import ButtonPrimary from 'components/Shared/Button/ButtonPrimary';
import Dropdown from 'components/Shared/Form/Dropdown';
import DatePicker from 'components/Shared/DatePicker';
import XIcon from 'components/Shared/Icons/XIcon';
import { ALL_COMMUNITIES_NAME, ALL_COMMUNITIES_INDEX } from 'constants/AppConstants';
import AllCommunitiesQuery from 'components/Shared/queries/AllCommunitiesQuery';

class HistoryFilter extends Component {
  constructor(props) {
    super(props);

    this.state = {
      communityId: props.communityId,
      dateLowerBound: props.dateLowerBound,
      dateLowerBoundKey: new Date().toISOString(),
      dateUpperBound: props.dateUpperBound,
      dateUpperBoundKey: new Date().toISOString(),
      inclusiveEndDate: props.inclusiveEndDate
    }
  }

  clearLowerBound = () => {
    this.setState({dateLowerBound: null});
  }

  clearUpperBound = () => {
    this.setState({dateUpperBound: null});
  }

  dateLowerBoundChanged = (date) => {
    this.setState({
      dateLowerBound: date,
      dateLowerBoundKey: new Date().toISOString(),
    });
  }

  dateUpperBoundChanged = (date) => {
    this.setState({
      dateUpperBound: date,
      dateUpperBoundKey: new Date().toISOString(),
    });
  }

  inclusiveEndDateChanged = (value) => {
    this.setState({inclusiveEndDate: value});
  }

  communityIdChanged = (e) => {
    this.setState({communityId: Number(e.target.value)});
  }

  onSubmit = () => {
    this.props.applyFilter({
      communityId: this.state.communityId,
      dateLowerBound: this.state.dateLowerBound,
      dateUpperBound: this.state.dateUpperBound,
      inclusiveEndDate: this.state.inclusiveEndDate
    });
  }

  onCancel = () => {
    this.setState((state, props) => {
      return {
        communityId: props.communityId,
        dateLowerBound: props.dateLowerBound,
        dateUpperBound: props.dateUpperBound,
        inclusiveEndDate: props.inclusiveEndDate
      }
    })
  }

  render() {
    const {
      communityId,
      dateLowerBound,
      dateLowerBoundKey,
      dateUpperBound,
      dateUpperBoundKey,
      inclusiveEndDate,
    } = this.state;

    let allCommunities;
    const communitiesLoading = !this.props.AllCommunitiesQuery || this.props.AllCommunitiesQuery.loading;
    if (communitiesLoading) {
      return <div>Loading...</div>
    }
    allCommunities = this.props.AllCommunitiesQuery.allCommunities.nodes.filter(node => node.id !== 1337 && node.id !== 9002);
    allCommunities.unshift({id: ALL_COMMUNITIES_INDEX, name: ALL_COMMUNITIES_NAME})

    const isDirty = (
      (communityId !== this.props.communityId) ||
      (dateLowerBound !== this.props.dateLowerBound) ||
      (dateUpperBound !== this.props.dateUpperBound) ||
      (inclusiveEndDate !== this.props.inclusiveEndDate)
    )
    return (
      <div className="HistoryFilter">
        {!this.props.crossingId && (
          <div className="HistoryFilter-community-row">
            <div>
              Community:
            </div>
            <Dropdown
              options={allCommunities}
              selected={communityId}
              onChange={this.communityIdChanged}
              disabled={!this.props.canSelectCommunity}
            />
          </div>
        )}
        <div className="HistoryFilter-row">
          <div>
            Start Date:
          </div>
          <div>
            <DatePicker
              date={dateLowerBound}
              key={dateLowerBoundKey}
              onChange={this.dateLowerBoundChanged}
              maxDate={dateUpperBound ?
                moment(dateUpperBound).subtract(1,'day').format('YYYY-MM-DD') :
                'today'
              }
            />
            {dateLowerBound ? (
              <div style={{"display": "inline"}}
                className='clear-filter-icon'
                onClick={this.clearLowerBound}
              >
                <XIcon/>
              </div>
            ) : (<div className="CrossingListSpacer" />)}
          </div>
        </div>
        <div className="HistoryFilter-row">
          <div>
            End Date:
          </div>
          <div>
            <DatePicker
              date={dateUpperBound}
              key={dateUpperBoundKey}
              onChange={this.dateUpperBoundChanged}
              minDate={dateLowerBound ?
                moment(dateLowerBound).add(1, 'day').format('YYYY-MM-DD') :
                null
              }
              maxDate='today'
            />
            {dateUpperBound ? (
              <div
                className='clear-filter-icon'
                onClick={this.clearUpperBound}
              >
                <XIcon/>
              </div>
            ) : (<div className="CrossingListSpacer" />)}
          </div>
        </div>
        {dateUpperBound && (
          <div className="HistoryFilter-row">
            <div>
              Include Data from End Date:
            </div>
            <div>
              <input
                type="checkbox"
                checked={inclusiveEndDate}
                onChange={() => {
                  this.inclusiveEndDateChanged(!inclusiveEndDate)
                }}
              />
            </div>
          </div>
        )}
        {isDirty && (
          <div
            className="EditUser__buttons"
            style={{paddingLeft: 0}}
          >
            <ButtonSecondary
              className="EditUser__cancel-button"
              onClick={this.onCancel}
            >
              Cancel
            </ButtonSecondary>
            <ButtonPrimary
              className="EditUser__next-button"
              onClick={this.onSubmit}
            >
              Apply
            </ButtonPrimary>
          </div>
        )}
      </div>
    )
  }
}

export default graphql(AllCommunitiesQuery, {
  name: "AllCommunitiesQuery"
})(HistoryFilter)
