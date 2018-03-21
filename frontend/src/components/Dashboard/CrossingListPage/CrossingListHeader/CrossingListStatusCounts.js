import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import classnames from 'classnames';

import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import FilterCheckbox from 'components/Shared/FilterCheckbox';

import 'components/Dashboard/CrossingListPage/CrossingListHeader/CrossingListHeader.css';

class CrossingListStatusCounts extends Component {
  render() {
    const isLoading = !this.props.data || this.props.data.loading;

    const {
      toggleShowOpen,
      toggleShowClosed,
      toggleShowCaution,
      toggleShowLongterm,
      showOpen,
      showClosed,
      showCaution,
      showLongterm,
      params,
    } = this.props;

    let openCrossingCount,
      closedCrossingCount,
      cautionCrossingCount,
      longtermCrossingCount;
    openCrossingCount = closedCrossingCount = cautionCrossingCount = longtermCrossingCount =
      ' ... ';
    if (!isLoading) {
      const {
        openCrossings,
        closedCrossings,
        cautionCrossings,
        longtermCrossings,
      } = this.props.data;
      openCrossingCount = openCrossings.totalCount;
      closedCrossingCount = closedCrossings.totalCount;
      cautionCrossingCount = cautionCrossings.totalCount;
      longtermCrossingCount = longtermCrossings.totalCount;
    }

    return (
      <div className={classnames(params, 'CrossingListFilter')}>
        <FilterCheckbox isChecked={showOpen} onClick={toggleShowOpen}>
          Open ({openCrossingCount})
        </FilterCheckbox>
        <FilterCheckbox isChecked={showCaution} onClick={toggleShowCaution}>
          Caution ({cautionCrossingCount})
        </FilterCheckbox>
        <FilterCheckbox isChecked={showClosed} onClick={toggleShowClosed}>
          Closed ({closedCrossingCount})
        </FilterCheckbox>
        <FilterCheckbox isChecked={showLongterm} onClick={toggleShowLongterm}>
          Long Term Closure ({longtermCrossingCount})
        </FilterCheckbox>
      </div>
    );
  }
}

export default graphql(statusCountsQuery, {
  options: ownProps => ({
    variables: {
      search: ownProps.formattedSearchQuery,
      communityId:
        ownProps.currentUser.role !== 'floods_super_admin'
          ? ownProps.currentUser.communityId
          : null,
    },
  }),
})(CrossingListStatusCounts);
