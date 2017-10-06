import React from 'react';
import { graphql } from 'react-apollo';
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
    if (!this.props.data || this.props.data.loading) {
      return (<div>Loading</div>)
    }
    const allCrossings = this.props.data.allCrossings.nodes;

    if (allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    return (
      <div>
        {allCrossings.map(crossing => <CrossingListItem crossing={crossing} />)}
      </div>
    );

  }

}

const allCrossings = gql`
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        description
        humanAddress
        statusUpdateByLatestStatusId {
          statusId
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


export default graphql(allCrossings)(CrossingList);
