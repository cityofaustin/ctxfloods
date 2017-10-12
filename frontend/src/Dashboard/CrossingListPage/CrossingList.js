import React from 'react';
import { graphql, compose } from 'react-apollo';
import CrossingListItem from './CrossingListItem/CrossingListItem'
import crossingsQuery from './queries/crossingsQuery'

import gql from 'graphql-tag';

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

    const crossings = this.props.crossingsQuery.allCrossings.nodes;
    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
    const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

    if (crossings == null || statusReasons == null || statusDurations == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    return (
      <div>
        {crossings.map(crossing => 
          <CrossingListItem
            crossing={crossing}
            reasons={statusReasons} 
            durations={statusDurations} />
        )}
      </div>
    );

  }

}



const statusReasonsQuery = gql`
  query allStatusReasons {
    allStatusReasons {
      nodes {
        id
        name
      }
    }
  }
`;

const statusDurationsQuery = gql`
  query allStatusDurations {
    allStatusDurations {
      nodes {
        id
        name
      }
    }
  }
`;



export default compose(
  graphql(crossingsQuery, { name: 'crossingsQuery' }),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
  graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
)(CrossingList);
