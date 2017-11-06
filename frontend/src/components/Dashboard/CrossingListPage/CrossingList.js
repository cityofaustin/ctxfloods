import React from 'react';
import { graphql, compose } from 'react-apollo';
import CrossingListItem from 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem';
import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
import statusReasonsQuery from 'components/Dashboard/CrossingListPage/queries/statusReasonsQuery';
import statusDurationsQuery from 'components/Dashboard/CrossingListPage/queries/statusDurationsQuery';
import 'components/Dashboard/CrossingListPage/CrossingList.css';
import * as statusConstants from 'components/Dashboard/CrossingListPage/CrossingListItem/StatusConstants';
import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';

const containerQuery = {
  'CrossingListItem--lg': {
    minWidth: 600,
  }
};

class CrossingList extends React.Component {

  render () {
    const isLoading = (
      !this.props.crossingsQuery ||
       this.props.crossingsQuery.loading ||
      !this.props.statusReasonsQuery ||
       this.props.statusReasonsQuery.loading ||
      !this.props.statusDurationsQuery ||
       this.props.statusDurationsQuery.loading
    );

    if ( isLoading ) { return (<div>Loading</div>) };

    const { showOpen, showClosed, showCaution, showLongterm, sortByUpdatedAsc, currentUser, searchQuery, previousPage, nextPage } = this.props;

    const crossings = this.props.crossingsQuery.searchCrossings.nodes.slice();

    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
    const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

    if (crossings == null || statusReasons == null || statusDurations == null) {
      // TODO: add error logging
      return (<div>Error Loading Crossings</div>);
    }

    const {startCursor, endCursor, hasPrevious, hasNext} = this.props.crossingsQuery.searchCrossings.pageInfo;

    crossings.sort((c1, c2) => {
      const createdAt1 = c1.statusUpdateByLatestStatusUpdateId.createdAt;
      const createdAt2 = c2.statusUpdateByLatestStatusUpdateId.createdAt;

      return sortByUpdatedAsc ?
              (createdAt1 > createdAt2 ? 1 : -1) :
              (createdAt2 > createdAt1 ? 1 : -1);
    });

    return (
      <div>
      <ContainerQuery query={containerQuery}>
        {(params) => {
          const cqClassName = classnames(params);
          return (
            <div className='CrossingListContainer'>
              {crossings.map(crossing => 
                <CrossingListItem
                  key={crossing.id}
                  crossing={crossing}
                  reasons={statusReasons} 
                  durations={statusDurations}
                  currentUser={currentUser}
                  cqClassName={cqClassName} 
                />
              )}
            </div>
          );
        }}
      </ContainerQuery>
      <div onClick={() => previousPage(hasPrevious ? startCursor : null)}>Previous Page</div>
      <div onClick={() => nextPage(this.props.crossingsQuery.searchCrossings.pageInfo.endCursor)}>Next Page</div>
      </div>
    );
  }
}

export default compose(
    graphql(crossingsQuery, {
    name: 'crossingsQuery',
    options: (ownProps) => ({
      variables: {
        search: ownProps.searchQuery,
        showOpen: ownProps.showOpen,
        showClosed: ownProps.showClosed,
        showCaution: ownProps.showCaution,
        showLongterm: ownProps.showLongterm,
        pageCursor: ownProps.pageCursor,
        orderAsc: ownProps.sortByUpdatedAsc
      }
    })
  }),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
  graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
)(CrossingList);
