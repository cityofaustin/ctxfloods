import React from 'react';
import { graphql, compose } from 'react-apollo';
import CrossingListItem from './CrossingListItem/CrossingListItem';
import crossingsQuery from './queries/crossingsQuery';
import statusReasonsQuery from './queries/statusReasonsQuery';
import statusDurationsQuery from './queries/statusDurationsQuery';
import './CrossingList.css';
import * as statusConstants from './CrossingListItem/StatusConstants';
import classnames from 'classnames';
import _ from 'lodash';

class CrossingList extends React.Component {
  state = {}

  render () {
    if ( !this.props.crossingsQuery ||
          this.props.crossingsQuery.loading ||
         !this.props.statusReasonsQuery ||
          this.props.statusReasonsQuery.loading ||
         !this.props.statusDurationsQuery ||
          this.props.statusDurationsQuery.loading) {
      return (<div>Loading</div>)
    }

    const { showOpen, showClosed, showCaution, showLongterm } = this.props;

    var crossings = this.props.crossingsQuery.allCrossings.nodes;
    _.sortBy(crossings, [(crossing) => crossing.statusUpdateByLatestStatusUpdateId.createdAt]);

    let crossingIdsToShow = crossings.filter(crossing => 
      crossing.latestStatusId == statusConstants.OPEN && showOpen ||
      crossing.latestStatusId == statusConstants.CLOSED && showClosed ||
      crossing.latestStatusId == statusConstants.CAUTION && showCaution ||
      crossing.latestStatusId == statusConstants.LONGTERM && showLongterm
    ).map(filteredCrossing => filteredCrossing.id);

    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
    const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

    if (crossings == null || statusReasons == null || statusDurations == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    return (
      <div className='CrossingListContainer'>
        {crossings.map(crossing => 
          <div className={classnames({'hiddenCrossing': !crossingIdsToShow.includes(crossing.id)})}>
            <CrossingListItem
              crossing={crossing}
              reasons={statusReasons} 
              durations={statusDurations} />
          </div>
        )}
      </div>
    );
  }
}

export default compose(
  graphql(crossingsQuery, { name: 'crossingsQuery' }),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
  graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
)(CrossingList);
