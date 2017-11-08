// // import React from 'react';
// // import { graphql, compose } from 'react-apollo';
// // import CrossingListItem from 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem';
// // import crossingsQuery from 'components/Dashboard/CrossingListPage/queries/crossingsQuery';
// // import statusReasonsQuery from 'components/Dashboard/CrossingListPage/queries/statusReasonsQuery';
// // import statusDurationsQuery from 'components/Dashboard/CrossingListPage/queries/statusDurationsQuery';
// // import 'components/Dashboard/CrossingListPage/CrossingList.css';
// // import * as statusConstants from 'components/Dashboard/CrossingListPage/CrossingListItem/StatusConstants';
// // import {ContainerQuery} from 'react-container-query';
// // import classnames from 'classnames';
// // import {InfiniteLoader, List} from 'react-virtualized';

// // const containerQuery = {
// //   'CrossingListItem--lg': {
// //     minWidth: 600,
// //   }
// // };

// // class CrossingList extends React.Component {

// //   render () {
// //     const isLoading = (
// //       !this.props.crossingsQuery ||
// //        this.props.crossingsQuery.loading ||
// //       !this.props.statusReasonsQuery ||
// //        this.props.statusReasonsQuery.loading ||
// //       !this.props.statusDurationsQuery ||
// //        this.props.statusDurationsQuery.loading
// //     );

// //     if ( isLoading ) { return (<div>Loading</div>) };

// //     const { showOpen, showClosed, showCaution, showLongterm, sortByUpdatedAsc, currentUser, searchQuery, previousPage, nextPage } = this.props;

// //     const crossings = this.props.crossingsQuery.searchCrossings.edges.slice();

// //     const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;
// //     const statusDurations = this.props.statusDurationsQuery.allStatusDurations.nodes;

// //     if (crossings == null || statusReasons == null || statusDurations == null) {
// //       // TODO: add error logging
// //       return (<div>Error Loading Crossings</div>);
// //     }

// //     const {startCursor, endCursor, hasPrevious, hasNext} = this.props.crossingsQuery.searchCrossings.pageInfo;

// //     // crossings.sort((c1, c2) => {
// //     //   const createdAt1 = c1.statusUpdateByLatestStatusUpdateId.createdAt;
// //     //   const createdAt2 = c2.statusUpdateByLatestStatusUpdateId.createdAt;

// //     //   return sortByUpdatedAsc ?
// //     //           (createdAt1 > createdAt2 ? 1 : -1) :
// //     //           (createdAt2 > createdAt1 ? 1 : -1);
// //     // });

// //     return (
// //       <div>
// //       <ContainerQuery query={containerQuery}>
// //         <InfiniteLoader
// //           isRowLoaded={this._isRowLoaded}
// //           loadMoreRows={loadMoreRows}
// //           rowCount={crossingsQuery.totalCount} >

// //         {(params) => {
// //           const cqClassName = classnames(params);
// //           return (
// //             <div className='CrossingListContainer'>
// //               {crossings.map(crossing => 
// //                 <CrossingListItem
// //                   key={crossing.cursor}
// //                   crossing={crossing.node}
// //                   reasons={statusReasons} 
// //                   durations={statusDurations}
// //                   currentUser={currentUser}
// //                   cqClassName={cqClassName} 
// //                 />
// //               )}
// //             </div>
// //           );
// //         }}
// //       </ContainerQuery>
// //       <div onClick={() => previousPage(hasPrevious ? startCursor : null)}>Previous Page</div>
// //       <div onClick={() => nextPage(this.props.crossingsQuery.searchCrossings.pageInfo.endCursor)}>Next Page</div>
// //       </div>
// //     );
// //   }
// // }

// // /******************************************************************************************************************
// //  *  GraphQL  Query to be executed
// //  ******************************************************************************************************************/
// // const configObject = {
// //   options: (ownProps) => ({
// //       variables: {
// //         search: ownProps.searchQuery,
// //         showOpen: ownProps.showOpen,
// //         showClosed: ownProps.showClosed,
// //         showCaution: ownProps.showCaution,
// //         showLongterm: ownProps.showLongterm,
// //         pageCursor: ownProps.pageCursor,
// //         orderAsc: ownProps.sortByUpdatedAsc
// //       }
// //     }),
// //   name: 'crossingsQuery',
// //   force:true,
// //   props:({ownProps,data})=>{
// //     // console.log("DATAA ===> ")
// //     // console.dir(data)
// //     const  { loading, crossingsQuery, fetchMore } = data
// // /******************************************************************************************************************
// //  *  This callback function is called to load more rows from GraphQL Server.
// //  ******************************************************************************************************************/    
// //     const loadMoreRows = ()=>{
// //         return fetchMore({
// //           variables:{
// //             pageCursor: crossingsQuery.pageInfo.endCursor,
// //           },
// //           updateQuery:(previousResult,{fetchMoreResult})=> {
// //             const totalCount=fetchMoreResult.data.crossingsQuery.totalCount
// //             const newEdges=fetchMoreResult.data.crossingsQuery.edges
// //             const pageInfo=fetchMoreResult.data.crossingsQuery.pageInfo

// //             return {
// //               // By returning `cursor` here, we update the `loadMore` function
// //               // to the new cursor.
// //               crossingsQuery:{
// //                 totalCount,
// //                 edges:[...previousResult.crossingsQuery.edges, ...newEdges],
// //                 pageInfo
// //               }
// //             };
// //           }
// //         })
// //       }
// // /******************************************************************************************************************
// //  *  props to be passed to subsequent children.
// //  ******************************************************************************************************************/
// //     return {
// //       loading,
// //       crossingsQuery,
// //       loadMoreRows
// //     }
// //   }
// // }


// // export default compose(
// //   graphql(crossingsQuery, configObject),
// //   graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
// //   graphql(statusDurationsQuery, { name: 'statusDurationsQuery' })
// // )(CrossingList);


// import React from "react";
// import ReactDOM from "react-dom"

// import {InfiniteLoader,AutoSizer,List} from "react-virtualized"

// let virtualizingList = []

// export default class ItemList extends React.Component{
//    constructor(props)
//    {
//      super(props)
//        const {loadMoreRows,mainQuery} = this.props
//        this._isRowLoaded = this._isRowLoaded.bind(this)
//        this._rowRenderer = this._rowRenderer.bind(this)
//        this._noRowsRenderer = this._noRowsRenderer.bind(this)
//    }
// /******************************************************************************************************************
//  *  Used in InfiniteLoader to track the loaded state of each row.
//  ******************************************************************************************************************/
//    _isRowLoaded ({ index }) {
//         return !!virtualizingList[index];
//    }

// /******************************************************************************************************************
//  *  Used in List to render each row.
//  ******************************************************************************************************************/
//    _rowRenderer({ key, index, style}) {
//         let content
//         if (index<virtualizingList.length) {
//             content = virtualizingList[index].node.item
//         } 
//         else {
//             content = (
//                 // <LinearProgress mode="indeterminate" />
//                  <div>Loading.....</div>       
//             )
//         }

//         return (
//             <ListItem
//                 key={key}
//                 style={style}
//                 primaryText={content}
//             />
//         )
//     }
// /******************************************************************************************************************
//  *  When no rows are returned
//  ******************************************************************************************************************/
//     _noRowsRenderer(){
//         return <h1>No Rows returned from GraphQL fetch....</h1>
//     }

// /******************************************************************************************************************
//  *  React render method for ItemList Component
//  ******************************************************************************************************************/
//    render(){  
//         const {loadMoreRows,mainQuery} = this.props
//         virtualizingList = mainQuery.edges

//     return (
//             <div style={{ marginLeft:"30%",}}>
//                 <InfiniteLoader
//                     isRowLoaded={this._isRowLoaded}
//                     loadMoreRows={loadMoreRows}
//                     rowCount={mainQuery.totalCount}
//                 >
//                     {({ onRowsRendered, registerChild }) => (
//                     <List
//                         height={500}
//                         onRowsRendered={onRowsRendered}
//                         noRowsRenderer={this._noRowsRenderer}
//                         ref={registerChild}
//                         rowCount={mainQuery.totalCount}
//                         rowHeight={40}
//                         rowRenderer={this._rowRenderer}
//                         width={500}
//                         overscanRowCount={0}
//                     />
//                     )}
//         </InfiniteLoader>
//       </div>
//     );
//   }
// }
