import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import InfiniteCrossingStatusHistoryList from 'components/Dashboard/CrossingStatusHistory/InfiniteCrossingStatusHistoryList';

import { graphql, compose } from 'react-apollo';

import {InfiniteLoader, AutoSizer, List} from 'react-virtualized';
import 'react-virtualized/styles.css';

import statusHistoryQuery from 'components/Dashboard/CrossingListPage/queries/statusHistoryQuery';

import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';

import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';

let infiniteCrossingListRef;
let crossingQueryVariables;

const containerQuery = {
  'CrossingStatusHistory--lg' : {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  }
}

const configObject = {
  options: (props) => {
    // crossingQueryVariables = {
    //   search: props.searchQuery,
    //   showOpen: props.showOpen,
    //   showClosed: props.showClosed,
    //   showCaution: props.showCaution,
    //   showLongterm: props.showLongterm,
    //   orderAsc: props.sortByUpdatedAsc,
    //   pageCursor: null
    // };

    return {
      variables: {}
    }
  },
  force: true,
  props: ({ownProps, data}) => {
    const  {loading, allStatusUpdates, fetchMore} = data;
    const loadMoreRows = () => {

      return fetchMore({
        variables:{
          pageCursor:allStatusUpdates.pageInfo.endCursor,
        },
        updateQuery:(previousResult, {fetchMoreResult}) => {
          const totalCount=fetchMoreResult.allStatusUpdates.totalCount;
          const newEdges=fetchMoreResult.allStatusUpdates.edges;
          const pageInfo=fetchMoreResult.allStatusUpdates.pageInfo;
          
          if(!previousResult.allStatusUpdates) {
            return;
          }

          return {
            allStatusUpdates: {
              __typename: 'StatusUpdatesConnection',
              totalCount,
              edges:[...previousResult.allStatusUpdates.edges, ...newEdges],
              pageInfo
            }
          };
        }
      })
    }

    return {
      loading,
      allStatusUpdates,
      loadMoreRows
    }
  }
}

export class InfiniteCrossingStatusHistoryPaginationContainer extends Component {
  
  render() {
    const {dispatch, loading, allStatusUpdates, loadMoreRows, currentUser, showNames} = this.props;
     
    if (loading) {
      return (<div>Loading</div>);
    };
    
    return (
      <ContainerQuery query={containerQuery}> 
        {(params) => {
          const cqClassName = classnames(params);
          return (
            <div>
              <InfiniteCrossingStatusHistoryList
                {...this.props}
                ref={(ref) => infiniteCrossingListRef = ref} 
                loadMoreRows={loadMoreRows}
                allStatusUpdates={allStatusUpdates}
                showNames={showNames}
                cqClassName={cqClassName} />
            </div>
          );
        }}
      </ContainerQuery>
    );
  }
}

export default graphql(statusHistoryQuery, configObject)(InfiniteCrossingStatusHistoryPaginationContainer);
