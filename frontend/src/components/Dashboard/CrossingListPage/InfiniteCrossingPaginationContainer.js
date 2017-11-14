import React from "react";
import ReactDOM from "react-dom"

// import ItemList from "../components/ItemList"
import InfiniteCrossingList from 'components/Dashboard/CrossingListPage/InfiniteCrossingList';

// import CircularProgress from 'material-ui/CircularProgress'
// import Divider from 'material-ui/Divider'
// import AppBar from 'material-ui/AppBar'
// import {List as MaterialList,ListItem} from 'material-ui/List'
// import {loadInitialData} from  '../actions/action'

import { graphql, compose } from 'react-apollo'
import gql from "graphql-tag"


import {InfiniteLoader,AutoSizer,List} from "react-virtualized"
import 'react-virtualized/styles.css'

// import {List} from "immutable"

import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
import statusReasonsQuery from 'components/Dashboard/CrossingListPage/queries/statusReasonsQuery';
import statusDurationsQuery from 'components/Dashboard/CrossingListPage/queries/statusDurationsQuery';

const configObject = {
  options: (props) => {
    // debugger;
    let after = props.endCursor || null; 

    return {
      variables: {
        search: props.searchQuery,
        showOpen: props.showOpen,
        showClosed: props.showClosed,
        showCaution: props.showCaution,
        showLongterm: props.showLongterm,
        pageCursor: after,
        orderAsc: props.searchByUpdatedAsc
      }
    }
  } ,
  force:true,
  props:({ownProps,data})=>{
    // console.log("DATAA ===> ")
    // console.dir(data)
    // debugger;
    const  { loading, searchCrossings, fetchMore } = data
/******************************************************************************************************************
 *  This callback function is called to load more rows from GraphQL Server.
 ******************************************************************************************************************/    
    const loadMoreRows = ()=>{
        // debugger;
        return fetchMore({
          variables:{
            pageCursor:searchCrossings.pageInfo.endCursor,
          },
          updateQuery:(previousResult,{fetchMoreResult})=> {
            // debugger;
            const totalCount=fetchMoreResult.searchCrossings.totalCount
            const newEdges=fetchMoreResult.searchCrossings.edges
            const pageInfo=fetchMoreResult.searchCrossings.pageInfo

            return {
              // By returning `cursor` here, we update the `loadMore` function
              // to the new cursor.
              searchCrossings:{
                __typename: 'SearchCrossingsConnection',
                totalCount,
                edges:[...previousResult.searchCrossings.edges, ...newEdges],
                pageInfo
              }
            };
          }
        })
      }
/******************************************************************************************************************
 *  props to be passed to subsequent children.
 ******************************************************************************************************************/
    return {
      loading,
      searchCrossings,
      loadMoreRows
    }
  }
}


/******************************************************************************************************************
 *  PaginationContainer 
 ******************************************************************************************************************/

export class InfiniteCrossingPaginationContainer extends React.Component{
   render() {  
      const isLoading = (
        !this.props.statusReasonsQuery ||
         this.props.statusReasonsQuery.loading ||
        !this.props.statusDurationsQuery ||
         this.props.statusDurationsQuery.loading
      );


      const {dispatch, loading, searchCrossings, loadMoreRows, currentUser} = this.props
      // debugger;
     
     if (loading || isLoading){
      return (<div>Loading</div>);
     }
    
    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
    const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

      return <InfiniteCrossingList 
                loadMoreRows={loadMoreRows}
                crossingsQuery={searchCrossings}
                statusReasons={statusReasons}
                statusDurations={statusDurations}
                currentUser={currentUser}
                />
  }
}

export default compose(
  graphql(crossingsQuery, configObject),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
  graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
)(InfiniteCrossingPaginationContainer);

// export default graphql(crossingsQuery,configObject)(InfiniteCrossingPaginationContainer)
// export default connect(mapStateToProps)(InfiniteCrossingPaginationContainerWithData)
