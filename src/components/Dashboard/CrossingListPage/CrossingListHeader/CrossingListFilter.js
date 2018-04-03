import React, { Component } from 'react';
import { graphql } from 'react-apollo';

import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import FilterCheckbox from 'components/Shared/FilterCheckbox';

class CrossingListFilter extends Component {
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
    } = this.props;

    let openCrossingCount,
      closedCrossingCount,
      cautionCrossingCount,
      longtermCrossingCount;
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
      <div className="CrossingListFilter">
        <FilterCheckbox
          isChecked={showOpen}
          onClick={toggleShowOpen}
          className="CrossingListFilterCheckbox"
        >
          Open {openCrossingCount !== undefined && `(${openCrossingCount})`}
        </FilterCheckbox>
        <FilterCheckbox
          isChecked={showCaution}
          onClick={toggleShowCaution}
          className="CrossingListFilterCheckbox"
        >
          Caution{' '}
          {cautionCrossingCount !== undefined && `(${cautionCrossingCount})`}
        </FilterCheckbox>
        <FilterCheckbox
          isChecked={showClosed}
          onClick={toggleShowClosed}
          className="CrossingListFilterCheckbox"
        >
          Closed{' '}
          {closedCrossingCount !== undefined && `(${closedCrossingCount})`}
        </FilterCheckbox>
        <FilterCheckbox
          isChecked={showLongterm}
          onClick={toggleShowLongterm}
          className="CrossingListFilterCheckbox"
        >
          Long-Term Closure{' '}
          {longtermCrossingCount !== undefined && `(${longtermCrossingCount})`}
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
})(CrossingListFilter);
