import React from 'react';
import { graphql, compose } from 'react-apollo';
import CrossingListItem from './CrossingListItem/CrossingListItem';
import crossingsQuery from './queries/crossingsQuery';
import statusReasonsQuery from './queries/statusReasonsQuery';
import statusDurationsQuery from './queries/statusDurationsQuery';
import './CrossingList.css';
import * as statusConstants from './CrossingListItem/StatusConstants';
import classnames from 'classnames';

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

    const { showOpen, showClosed, showCaution, showLongterm, invertSort } = this.props;

    const crossings = this.props.crossingsQuery.allCrossings.nodes;
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

    debugger;
    var sortedCrossings = invertSort ? 
      crossings.slice().sort((c1, c2) => (c2.id - c1.id)) :
      crossings.slice().sort((c1, c2) => (c1.id - c2.id));

    return (
      <div className='CrossingListContainer'>
        {sortedCrossings.map(crossing => 
          <CrossingListItem
            key={crossing.id}
            crossing={crossing}
            reasons={statusReasons} 
            durations={statusDurations}
            hidden={!crossingIdsToShow.includes(crossing.id)} />
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
