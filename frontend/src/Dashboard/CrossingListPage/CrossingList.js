import React from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingListItem from './CrossingListItem/CrossingListItem'

class CrossingList extends React.Component {
  // methods here
  parseLastUpdate(update) {
    const timestamp = update.createdAt
    // format date/time
    const actor = update.userByCreatorId.firstName + " " + update.userByCreatorId.lastName

    return (timestamp + " by " + actor);
  }
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

    // debugger;
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

const crossingsQuery = gql`
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        description
        humanAddress
        statusUpdateByLatestStatusId {
          statusId
          statusReasonId
          statusDurationId
          createdAt
          userByCreatorId {
            firstName
            lastName
          }
        }
        communityCrossingsByCrossingId {
          nodes {
            communityByCommunityId {
              name
            }
          }
        }
      }
    }
  }
`;

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
