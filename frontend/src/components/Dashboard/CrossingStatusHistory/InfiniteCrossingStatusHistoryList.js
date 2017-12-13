import React from 'react';
import ReactDOM from 'react-dom';
import CrossingListItem from 'components/Dashboard/CrossingListPage/CrossingListItem/CrossingListItem';
import {InfiniteLoader, AutoSizer, List, WindowScroller, CellMeasurer, CellMeasurerCache} from 'react-virtualized';
import 'components/Dashboard/CrossingListPage/CrossingList.css';

let virtualizingList = [];
let listRef;

export default class InfiniteCrossingStatusHistoryList extends React.Component{

  constructor(props) {
    super(props);

    const {loadMoreRows,statusHistoryQuery} = this.props;
    this._isRowLoaded = this._isRowLoaded.bind(this);
    this._rowRenderer = this._rowRenderer.bind(this);
    this._noRowsRenderer = this._noRowsRenderer.bind(this);
  }

  _isRowLoaded ({ index }) {
    return !!virtualizingList[index];
  }

  _rowRenderer({ key, index, style, parent}) {

    // if (index<virtualizingList.length) {
    //   crossing = virtualizingList[index].node
    // } else {
    //   return (
    //     <div key={key}>Loading.....</div>       
    //   )
    // }

    return (
      <div>HERE IS THE THING</div>
    )
  }

  _noRowsRenderer(){
      return <h1>No Rows returned from GraphQL fetch....</h1>
  }

  render() {

    const {loadMoreRows,allStatusUpdates} = this.props;

    if(!allStatusUpdates) {
      return (<div>Loading</div>);
    }

    virtualizingList = allStatusUpdates.edges;

    return (
      <div>
        <InfiniteLoader
          isRowLoaded={this._isRowLoaded}
          loadMoreRows={loadMoreRows}
          rowCount={allStatusUpdates.totalCount}
          threshold={10}>
          {({ onRowsRendered, registerChild }) => (
            <WindowScroller>
              {({ height, isScrolling, scrollTop }) => (
                <List
                  ref={ref => registerChild = listRef = ref}
                  className="List"
                  height={500}
                  rowHeight={200}
                  width={500}
                  onRowsRendered={onRowsRendered}
                  rowCount={allStatusUpdates.totalCount}
                  rowRenderer={this._rowRenderer}
                  scrollTop={scrollTop} />
              )}
            </WindowScroller>
          )}
        </InfiniteLoader>
      </div>
    );
  }
}
