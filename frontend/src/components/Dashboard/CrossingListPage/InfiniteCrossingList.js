import React from "react";
import ReactDOM from "react-dom"

// import TextField from 'material-ui/TextField'
// import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
// import {ListItem} from 'material-ui/List'
import CrossingListItem from 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem';
// import LinearProgress from 'material-ui/LinearProgress'

// import injectTapEventPlugin from 'react-tap-event-plugin'

import {InfiniteLoader,AutoSizer,List, WindowScroller} from "react-virtualized"

// injectTapEventPlugin()

let virtualizingList = []

export default class InfiniteCrossingList extends React.Component{
   constructor(props)
   {
     super(props)
       // debugger;
       const {loadMoreRows,crossingsQuery} = this.props
       this._isRowLoaded = this._isRowLoaded.bind(this)
       this._rowRenderer = this._rowRenderer.bind(this)
       this._noRowsRenderer = this._noRowsRenderer.bind(this)
   }
/******************************************************************************************************************
 *  Used in InfiniteLoader to track the loaded state of each row.
 ******************************************************************************************************************/
   _isRowLoaded ({ index }) {
        return !!virtualizingList[index];
   }

/******************************************************************************************************************
 *  Used in List to render each row.
 ******************************************************************************************************************/
   _rowRenderer({ key, index, style}) {
        let crossing
        if (index<virtualizingList.length) {
            crossing = virtualizingList[index].node
        } 
        else {
            return (
                // <LinearProgress mode="indeterminate" />
                 <div key={key}>Loading.....</div>       
            )
        }

        // debugger;

        return (
                <CrossingListItem
                  key={crossing.id}
                  crossing={crossing}
                  reasons={[1,2,3]} 
                  durations={[1,2,3]}
                  currentUser={1}
                  cqClassName='CrossingListItem--lg' 
                />
        )
    }
/******************************************************************************************************************
 *  When no rows are returned
 ******************************************************************************************************************/
    _noRowsRenderer(){
        return <h1>No Rows returned from GraphQL fetch....</h1>
    }

/******************************************************************************************************************
 *  React render method for ItemList Component
 ******************************************************************************************************************/
   render(){  
        const {loadMoreRows,crossingsQuery} = this.props
        virtualizingList = crossingsQuery.edges

        // debugger;

    return (
      <div>

          <InfiniteLoader
            isRowLoaded={this._isRowLoaded}
            loadMoreRows={loadMoreRows}
            rowCount={crossingsQuery.totalCount}
            threshold={10}>
            {({ onRowsRendered, registerChild }) => (
              <WindowScroller>
                {({ height, isScrolling, scrollTop }) => (
                  <AutoSizer disableHeight>
                    {({ width }) => (
                      <List
                        ref={registerChild}
                        className="List"
                        autoHeight
                        height={height}
                        width={width}
                        onRowsRendered={onRowsRendered}
                        rowCount={crossingsQuery.totalCount}
                        rowHeight={200}
                        rowRenderer={this._rowRenderer}
                        scrollTop={scrollTop} />
                    )}
                  </AutoSizer>
                )}
              </WindowScroller>
            )}
          </InfiniteLoader>

      </div>
    );
  }
}

/*

            <div style={{ marginLeft:"30%",}}>
                <InfiniteLoader
                    isRowLoaded={this._isRowLoaded}
                    loadMoreRows={loadMoreRows}
                    rowCount={crossingsQuery.totalCount}
                >
                    {({ onRowsRendered, registerChild }) => (
                    <List
                        height={500}
                        onRowsRendered={onRowsRendered}
                        noRowsRenderer={this._noRowsRenderer}
                        ref={registerChild}
                        rowCount={crossingsQuery.totalCount}
                        rowHeight={40}
                        rowRenderer={this._rowRenderer}
                        width={500}
                        overscanRowCount={0}
                    />
                    )}
        </InfiniteLoader>
      </div>

*/
