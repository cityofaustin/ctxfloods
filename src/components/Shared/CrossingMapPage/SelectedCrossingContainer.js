import React, { Component } from 'react';
import DashboardCrossingListItem from 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/DashboardCrossingListItem';
import PublicCrossingListItem from 'components/Public/CrossingListItem/PublicCrossingListItem';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import statusUpdateFragment from 'components/Dashboard/CrossingListPage/queries/statusUpdateFragment';
import statusReasonsQuery from 'components/Dashboard/CrossingListPage/queries/statusReasonsQuery';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';

import MobileDetailsContainer from 'components/Shared/Map/MobileDetailsContainer';

class SelectedCrossingContainer extends Component {
  componentDidUpdate(prevProps) {
    if (!this.props.isMobileDetails) return;

    if (
      this.props.data &&
      !this.props.data.loading &&
      this.props.data.crossingById
    ) {
      if (!prevProps.data || !prevProps.data.crossingById) {
        const {
          crossingId,
          statusReasonId,
          reopenDate,
          indefiniteClosure,
          notes,
        } = this.props.data.crossingById.statusUpdateByLatestStatusUpdateId;
        this.props.setHeight(
          crossingId,
          statusReasonId,
          reopenDate,
          indefiniteClosure,
          notes,
        );
      }
    }
  }

  render() {
    const { currentUser, selectCrossing, allCommunities, onDash } = this.props;

    const isLoading =
      !this.props.data ||
      this.props.data.loading ||
      !this.props.statusReasonsQuery ||
      this.props.statusReasonsQuery.loading ||
      !this.props.data.crossingById;

    if (isLoading) {
      return null;
    }

    const crossing = this.props.data.crossingById;
    const statusReasons = this.props.statusReasonsQuery.allStatusReasons.nodes;

    if (this.props.isMobileDetails) {
      return (
        <MobileDetailsContainer
          crossing={crossing}
          reasons={statusReasons}
        />
      );
    }

    return currentUser ? (
      <DashboardCrossingListItem
        key={crossing.id}
        crossing={crossing}
        reasons={statusReasons}
        currentUser={currentUser}
        listOrMap="map"
        selectCrossing={selectCrossing}
        allCommunities={allCommunities}
        onDash={onDash}
      />
    ) : (
      <PublicCrossingListItem
        key={crossing.id}
        crossing={crossing}
        reasons={statusReasons}
        allCommunities={allCommunities}
        onDash={onDash}
      />
    );
  }
}

const crossingQuery = gql`
  query crossingById($crossingId: Int!) {
    crossingById(id: $crossingId) {
      id
      ...crossingInfo
      ...statusUpdateInfo
    }
  }
  ${crossingFragment}
  ${statusUpdateFragment}
`;

export default compose(
  graphql(crossingQuery, {
    options: ownProps => ({
      variables: {
        crossingId: ownProps.crossingId,
      },
    }),
  }),
  graphql(statusReasonsQuery, { name: 'statusReasonsQuery' }),
)(SelectedCrossingContainer);
