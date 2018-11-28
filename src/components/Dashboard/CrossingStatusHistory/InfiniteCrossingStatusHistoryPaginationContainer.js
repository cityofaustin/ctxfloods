import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';

import InfiniteCrossingStatusHistoryList from 'components/Dashboard/CrossingStatusHistory/InfiniteCrossingStatusHistoryList';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';

import 'react-virtualized/styles.css';

const containerQuery = {
  'CrossingStatusHistory--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
  fullsize: { minWidth: 768 },
  smallsize: { maxWidth: 767 },
};

export class InfiniteCrossingStatusHistoryPaginationContainer extends Component {
  static propTypes = {
    showNames: PropTypes.bool,
  };

  static defaultProps = {
    showNames: false,
  };

  render() {
    return (
      <ContainerQuery query={containerQuery}>
        {params => {
          const cqClassName = classnames(params);
          return (
            <div>
              <InfiniteCrossingStatusHistoryList
                {...this.props}
                cqClassName={cqClassName}
                cqParams={params}
              />
            </div>
          );
        }}
      </ContainerQuery>
    );
  }
}

export default InfiniteCrossingStatusHistoryPaginationContainer;
