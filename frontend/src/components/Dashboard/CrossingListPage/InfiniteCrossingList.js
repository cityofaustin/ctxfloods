import React from 'react';
import ReactDOM from 'react-dom';

import CrossingListItem from 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem';

import {InfiniteLoader, AutoSizer, List, WindowScroller, CellMeasurer, CellMeasurerCache} from 'react-virtualized';

let virtualizingList = [];
let listRef;

const cache = new CellMeasurerCache({
  defaultHeight: 400,
  fixedWidth: true
});

export default class InfiniteCrossingList extends React.Component{

  constructor(props) {
    super(props);
    const {loadMoreRows,crossingsQuery} = this.props;
    this._isRowLoaded = this._isRowLoaded.bind(this);
    this._rowRenderer = this._rowRenderer.bind(this);
    this._noRowsRenderer = this._noRowsRenderer.bind(this);
    this.clearMeasurerCache = this.clearMeasurerCache.bind(this);
    this.refreshList = this.refreshList.bind(this);
  }

  componentDidUpdate(prevProps) {
    if(this.props.sortByUpdatedAsc != prevProps.sortByUpdatedAsc) {
      this.refreshList();
    };
    this.clearMeasurerCache();
  }

  clearMeasurerCache() {
    cache.clearAll();
    listRef.recomputeRowHeights();
  }

  refreshList() {
    listRef.forceUpdateGrid();
  }

  _isRowLoaded ({ index }) {
    return !!virtualizingList[index];
  }

  _rowRenderer({ key, index, style, parent}) {

    const {statusReasons, statusDurations, currentUser, crossingQueryVariables} = this.props;
    let crossing;

    if (index<virtualizingList.length) {
      crossing = virtualizingList[index].node
    } else {
      return (
        <div key={key}>Loading.....</div>       
      )
    }

    return (
      <CellMeasurer
        cache={cache}
        columnIndex={0}
        key={key}
        parent={parent}
        rowIndex={index} >
        {({ measure }) => (
          <div style={style}>
            <CrossingListItem
              onLoad={measure}
              key={crossing.id}
              crossing={crossing}
              reasons={statusReasons} 
              durations={statusDurations}
              currentUser={currentUser}
              cqClassName='CrossingListItem--lg'
              clearMeasurerCache={() => this.clearMeasurerCache(index)}
              refreshList={() => this.refreshList()}
              crossingQueryVariables={crossingQueryVariables} />
          </div>
        )}
      </CellMeasurer>
    )
  }

  _noRowsRenderer(){
      return <h1>No Rows returned from GraphQL fetch....</h1>
  }

  render() {

    const {loadMoreRows,crossingsQuery} = this.props;

    if(!crossingsQuery) {
      return (<div>Loading</div>);
    }

    virtualizingList = crossingsQuery.edges;

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
                      ref={ref => registerChild = listRef = ref}
                      className="List"
                      autoHeight
                      height={height}
                      width={width}
                      onRowsRendered={onRowsRendered}
                      rowCount={crossingsQuery.totalCount}
                      deferredMeasurementCache={cache}
                      rowHeight={cache.rowHeight}
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
