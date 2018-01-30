import React, { Component } from 'react';
import InfiniteCrossingList from 'components/Dashboard/CrossingListPage/InfiniteCrossingList';
import { graphql, compose } from 'react-apollo';
import 'react-virtualized/styles.css';
import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
import statusReasonsQuery from 'components/Dashboard/CrossingListPage/queries/statusReasonsQuery';
import statusDurationsQuery from 'components/Dashboard/CrossingListPage/queries/statusDurationsQuery';
import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';

// The linter can't figure out how we're using this ref so I'm just gonna...
// eslint-disable-next-line
let infiniteCrossingListRef;
let crossingQueryVariables;

const containerQuery = {    
  'CrossingListItem--lg': {
    minWidth: 600, 
  } 
};

const configObject = {
  options: (props) => {
    crossingQueryVariables = {
      search: props.searchQuery,
      showOpen: props.showOpen,
      showClosed: props.showClosed,
      showCaution: props.showCaution,
      showLongterm: props.showLongterm,
      communityId: props.currentUser.role !== "floods_super_admin" ? props.currentUser.communityId : null,
      orderAsc: props.sortByUpdatedAsc,
      pageCursor: null
    };

    return {
      variables: crossingQueryVariables
    }
  },
  force: true,
  props: ({ownProps, data}) => {
    const  {loading, searchCrossings, fetchMore} = data;
    const loadMoreRows = () => {

      return fetchMore({
        variables:{
          pageCursor:searchCrossings.pageInfo.endCursor,
        },
        updateQuery:(previousResult, {fetchMoreResult}) => {
          const totalCount=fetchMoreResult.searchCrossings.totalCount;
          const newEdges=fetchMoreResult.searchCrossings.edges;
          const pageInfo=fetchMoreResult.searchCrossings.pageInfo;
          
          if(!previousResult.searchCrossings) {
            return;
          }

          return {
            searchCrossings: {
              __typename: 'SearchCrossingsConnection',
              totalCount,
              edges:[...previousResult.searchCrossings.edges, ...newEdges],
              pageInfo
            }
          };
        }
      })
    }

    return {
      loading,
      searchCrossings,
      loadMoreRows
    }
  }
}

export class InfiniteCrossingPaginationContainer extends Component {
  
  render() {  
    const isLoading = (
     !this.props.statusReasonsQuery ||
      this.props.statusReasonsQuery.loading ||
     !this.props.statusDurationsQuery ||
      this.props.statusDurationsQuery.loading ||
      this.props.loading
    );

    const { searchCrossings, loadMoreRows, currentUser, sortByUpdatedAsc} = this.props;
     
    if (isLoading) {
      return '';
    };
    
    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
    const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

    return (
      <ContainerQuery query={containerQuery}> 
        {(params) => {
          const cqClassName = classnames(params);
          return (
            <div className="CrossingListPage_crossing-list-container">
              <InfiniteCrossingList
                {...this.props}
                ref={(ref) => infiniteCrossingListRef = ref} 
                loadMoreRows={loadMoreRows}
                crossingsQuery={searchCrossings}
                statusReasons={statusReasons}
                statusDurations={statusDurations}
                currentUser={currentUser}
                sortByUpdatedAsc={sortByUpdatedAsc}
                crossingQueryVariables={crossingQueryVariables}
                cqClassName={cqClassName} />
            </div>
          );
        }}
      </ContainerQuery>
    );
  }
}

export default compose(
  graphql(crossingsQuery, configObject),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
  graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
)(InfiniteCrossingPaginationContainer);
