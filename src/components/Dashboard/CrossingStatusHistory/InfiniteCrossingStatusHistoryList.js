import React from 'react';
import PropTypes from 'prop-types';
import {
  InfiniteLoader,
  AutoSizer,
  List,
  WindowScroller,
  CellMeasurer,
  CellMeasurerCache,
} from 'react-virtualized';

import CrossingStatusHistoryItem from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistoryItem';
import 'components/Dashboard/CrossingListPage/CrossingListPage.css';

let virtualizingList = [];
let listRef;

const cache = new CellMeasurerCache({
  defaultHeight: 400,
  fixedWidth: true,
});

export default class InfiniteCrossingStatusHistoryList extends React.Component {
  static propTypes = {
    showNames: PropTypes.bool,
  };

  static defaultProps = {
    showNames: false,
  };

  constructor(props) {
    super(props);

    this._isRowLoaded = this._isRowLoaded.bind(this);
    this._rowRenderer = this._rowRenderer.bind(this);
    this._noRowsRenderer = this._noRowsRenderer.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    if (listRef) {
      this.refreshList();
      this.clearMeasurerCache();
    }
  }

  componentDidMount() {
    if (listRef) {
      this.refreshList();
      this.clearMeasurerCache();
    }
  }

  clearMeasurerCache() {
    cache.clearAll();
    listRef.recomputeRowHeights();
  }

  refreshList() {
    listRef.forceUpdateGrid();
  }

  _isRowLoaded({ index }) {
    return !!virtualizingList[index];
  }

  _rowRenderer({ key, index, style, parent }) {
    const { showNames, cqParams } = this.props;
    let statusUpdate;

    if (index < virtualizingList.length) {
      statusUpdate = virtualizingList[index].node;
    } else {
      return <div key={key}>Loading.....</div>;
    }

    return (
      <CellMeasurer
        cache={cache}
        columnIndex={0}
        key={key}
        parent={parent}
        rowIndex={index}
      >
        {({ measure }) => (
          <div
            className="CrossingStatusHistoryItemMeasureContainer"
            style={style}
          >
            <CrossingStatusHistoryItem
              measure={measure}
              key={key}
              update={statusUpdate}
              showNames={showNames}
              cqParams={cqParams}
            />
          </div>
        )}
      </CellMeasurer>
    );
  }

  _noRowsRenderer() {
    return <h1>No Rows returned from GraphQL fetch....</h1>;
  }

  render() {
    const { loadMoreRows, allStatusUpdates } = this.props;

    if (!allStatusUpdates) {
      return <div>Loading</div>;
    }

    virtualizingList = allStatusUpdates.edges;

    return (
      <div style={{ height: 'calc(100vh - 140px)' }}>
        <InfiniteLoader
          isRowLoaded={this._isRowLoaded}
          loadMoreRows={loadMoreRows}
          rowCount={allStatusUpdates.totalCount}
          threshold={10}
        >
          {({ onRowsRendered, registerChild }) => (
            <AutoSizer>
              {({ height, width }) => (
                <List
                  ref={ref => (registerChild = listRef = ref)}
                  className="List"
                  height={height}
                  deferredMeasurementCache={cache}
                  rowHeight={cache.rowHeight}
                  width={width}
                  onRowsRendered={onRowsRendered}
                  rowCount={allStatusUpdates.totalCount}
                  rowRenderer={this._rowRenderer}
                />
              )}
            </AutoSizer>
          )}
        </InfiniteLoader>
      </div>
    );
  }
}
