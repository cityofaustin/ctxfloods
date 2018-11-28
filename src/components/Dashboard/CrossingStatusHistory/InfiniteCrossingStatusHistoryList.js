import React from 'react';
import PropTypes from 'prop-types';
import { graphql } from 'react-apollo';
import {
  InfiniteLoader,
  AutoSizer,
  List,
  CellMeasurer,
  CellMeasurerCache,
} from 'react-virtualized';

import StatusHistoryQuery from 'components/Dashboard/CrossingListPage/queries/statusHistoryQuery';
import CrossingStatusHistoryItem from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistoryItem';
import 'components/Dashboard/CrossingListPage/CrossingListPage.css';

let virtualizingList = [];
// The linter can't figure out how we're using this ref so I'm just gonna...
// eslint-disable-next-line
let listRef;

const batchCount = 100;

const cache = new CellMeasurerCache({
  defaultHeight: 400,
  fixedWidth: true,
});

const graphqlConfig = {
  options: ownProps => {
    return {
      variables: {
        communityId: ownProps.communityId,
        crossingId: ownProps.crossingId,
        dateLowerBound: ownProps.dateLowerBound,
        dateUpperBound: ownProps.dateUpperBound,
        idUpperBound: null,
        rowLimit: batchCount
      }
    }
  },
  props: ({ ownProps, data }) => {
    const { loading, getStatusUpdateHistory, fetchMore } = data;
    const loadMoreRows = () => {
      const lastId = getStatusUpdateHistory.edges[getStatusUpdateHistory.edges.length-1].node.statusUpdateId;
      return fetchMore({
        variables: {
          communityId: ownProps.communityId,
          crossingId: ownProps.crossingId,
          dateLowerBound: ownProps.dateLowerBound,
          dateUpperBound: ownProps.dateUpperBound,
          idUpperBound: lastId,
          rowLimit: batchCount
        },
        updateQuery: (previousResult, { fetchMoreResult }) => {
          const newEdges = fetchMoreResult.getStatusUpdateHistory.edges;
          if (!previousResult.getStatusUpdateHistory) {
            return;
          }
          return {
            getStatusUpdateHistory: {
              __typename: "StatusUpdateHistoriesConnection",
              edges: [...previousResult.getStatusUpdateHistory.edges, ...newEdges],
            },
          };
        },
      });
    }

    return {
      loading,
      getStatusUpdateHistory,
      loadMoreRows
    }
  }
}

class InfiniteCrossingStatusHistoryList extends React.Component {
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

    // Otherwise we sometimes get this TypeError: Cannot assign to read only property 'left' of object '#<Object>'
    const modifiedStyle = Object.assign({}, style);
    modifiedStyle.left = "50%";

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
            className="CrossingStatusHistory__list-wrapper"
            style={modifiedStyle}
          >
            <div style={{position: "relative", left: "-50%"}}>
              <CrossingStatusHistoryItem
                measure={measure}
                key={key}
                update={statusUpdate}
                showNames={showNames}
                cqParams={cqParams}
              />
            </div>
          </div>
        )}
      </CellMeasurer>
    );
  }

  _noRowsRenderer() {
    return <h1>No Rows returned from GraphQL fetch....</h1>;
  }

  render() {
    const { loadMoreRows, getStatusUpdateHistory } = this.props;

    if (!getStatusUpdateHistory) {
      return <div>Loading</div>;
    }

    virtualizingList = getStatusUpdateHistory.edges;
    const rowCount = this.props.maxRows || virtualizingList.length;

    return (
      <div style={{ height: 'calc(100vh - 140px)' }}>
        <InfiniteLoader
          isRowLoaded={this._isRowLoaded}
          loadMoreRows={loadMoreRows}
          rowCount={rowCount}
          threshold={20}
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
                  rowCount={rowCount}
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

export default graphql(StatusHistoryQuery, graphqlConfig)(InfiniteCrossingStatusHistoryList);
