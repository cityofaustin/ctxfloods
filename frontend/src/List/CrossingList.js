import React from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

const STATUS_OPEN = 1;
const STATUS_CLOSED = 2;


class CrossingList extends React.Component {
  state = {}

  render () {
    if (this.props.data.loading) {
      return (<div>Loading</div>)
    }

    if (this.props.data.allCrossings == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    const allCrossings = this.props.data.allCrossings.nodes;

    return (<div>Loaded CrossingList</div>);
  }

}

const allCrossings = gql`
  query allCrossings {
    allCrossings {
      nodes {
        id
        name
        geojson
        statusUpdateByLatestStatusId {
          statusId
        }
      }
    }
  }
`;

export default graphql(allCrossings)(CrossingList);
