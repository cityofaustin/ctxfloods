import React from "react";
import ReactDOM from "react-dom"

// import ItemList from "../components/ItemList"
import InfiniteCrossingList from 'components/Dashboard/CrossingListPage/InfiniteCrossingList';

// import CircularProgress from 'material-ui/CircularProgress'
// import Divider from 'material-ui/Divider'
// import AppBar from 'material-ui/AppBar'
// import {List as MaterialList,ListItem} from 'material-ui/List'
// import {loadInitialData} from  '../actions/action'

import { graphql } from 'react-apollo'
import gql from "graphql-tag"


import {InfiniteLoader,AutoSizer,List} from "react-virtualized"
import 'react-virtualized/styles.css'

// import {List} from "immutable"

import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';

const configObject = {
  options: (props) => {
    // debugger;
    let after = props.endCursor || null; 
    return {
      variables: {
        search: '%',
        showOpen: true,
        showClosed: true,
        showCaution: true,
        showLongterm: true,
        pageCursor: after,
        orderAsc: false
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
            debugger;
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
      const {dispatch,loading,searchCrossings,loadMoreRows} = this.props
     
     if (loading){
      return (<div>Loading</div>);
     }
     else {
      return <InfiniteCrossingList loadMoreRows={loadMoreRows} crossingsQuery={searchCrossings}/>
    }
  }
}

export default graphql(crossingsQuery,configObject)(InfiniteCrossingPaginationContainer)
// export default connect(mapStateToProps)(InfiniteCrossingPaginationContainerWithData)
