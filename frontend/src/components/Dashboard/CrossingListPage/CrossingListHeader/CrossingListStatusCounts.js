import React, { Component } from 'react';
import 'components/Dashboard/CrossingListPage/CrossingListHeader/CrossingListHeader.css';
import statusCountsQuery from 'components/Dashboard/CrossingListPage/queries/statusCountsQuery';
import { graphql } from 'react-apollo';
import classnames from 'classnames';

class CrossingListStatusCounts extends Component {
  render() {
    const isLoading = (
      !this.props.data ||
       this.props.data.loading
    );

    if ( isLoading ) { return '' };

    const { toggleShowOpen,
            toggleShowClosed,
            toggleShowCaution, 
            toggleShowLongterm, 
            toggleSortByUpdated, 
            showOpen, 
            showClosed, 
            showCaution, 
            showLongterm,
            formattedSearchQuery,
            params } = this.props;

    const { openCrossings, closedCrossings, cautionCrossings, longtermCrossings } = this.props.data;

    return (

    <div className={classnames(params, 'CrossingListFilter')}>
      <label className={classnames(params, 'CrossingListFilterItem')}>
        <input className={classnames(params, 'CrossingListFilterCheckbox')} type='checkbox' defaultChecked={showOpen} onClick={toggleShowOpen}/>
        Open ({openCrossings.totalCount})
      </label>
      <label className={classnames(params, 'CrossingListFilterItem')}>
        <input className={classnames(params, 'CrossingListFilterCheckbox')} type='checkbox' defaultChecked={showCaution} onClick={toggleShowCaution}/>
        Caution ({cautionCrossings.totalCount})
      </label>
      <label className={classnames(params, 'CrossingListFilterItem')}>
        <input className={classnames(params, 'CrossingListFilterCheckbox')} type='checkbox' defaultChecked={showClosed} onClick={toggleShowClosed}/>
        Closed ({closedCrossings.totalCount})
      </label>
      <label className={classnames(params, 'CrossingListFilterItem')}>
        <input className={classnames(params, 'CrossingListFilterCheckbox')} type='checkbox' defaultChecked={showLongterm} onClick={toggleShowLongterm}/>
        Long Term Closure ({longtermCrossings.totalCount})
      </label>
    </div>

    );
  }
}

export default graphql(statusCountsQuery, {
  options: (ownProps) => ({
    variables: {
      search: ownProps.formattedSearchQuery,
      communityId: (ownProps.currentUser.role !== "floods_super_admin") ? ownProps.currentUser.communityId : null
    }
  })
})(CrossingListStatusCounts);
