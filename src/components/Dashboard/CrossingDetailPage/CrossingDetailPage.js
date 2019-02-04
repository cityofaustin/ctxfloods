import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import CrossingStaticMap from 'components/Shared/Map/CrossingStaticMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import CrossingStatusHistory from 'components/Dashboard/CrossingStatusHistory/CrossingStatusHistory';
import AllCommunitiesQuery from 'components/Shared/queries/AllCommunitiesQuery';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';

class CrossingDetailPage extends Component {
  render() {
    const isLoading =
      !this.props.CrossingByIdQuery ||
      this.props.CrossingByIdQuery.loading

    if (isLoading) {
      return <div>Loading</div>;
    }

    const crossing = this.props.CrossingByIdQuery.crossingById;
    const coordinates = JSON.parse(crossing.geojson).coordinates;
    const crossingForCrossingDetails = {
      name: crossing.name,
      description: crossing.description,
      humanAddress: crossing.humanAddress,
      id: crossing.id,
      lat: coordinates[1],
      lng: coordinates[0],
    }
    const allCommunities = this.props.AllCommunitiesQuery.allCommunities.nodes;
    const crossingCommunities = crossing.communities.nodes;
    const { currentUser } = this.props;

    return (
      <div className="CrossingDetailPage">
        <div className="CrossingDetails__container">
          <CrossingStaticMap crossing={crossing} />
          <CrossingDetails
            crossing={crossingForCrossingDetails}
            crossingCommunities={crossingCommunities}
            allCommunities={allCommunities}
            currentUser={currentUser}
            addMode={false}
          />
        </div>
        <CrossingStatusHistory crossingId={crossing.id}/>
      </div>
    );
  }
}

const CrossingByIdQuery = gql`
  query crossingById($crossingId: Int!) {
    crossingById(id: $crossingId) {
      ...crossingInfo
      statusByLatestStatusId {
        id
        name
      }
    }
  }
  ${crossingFragment}
`;

export default compose(
  graphql(CrossingByIdQuery, {
    name: 'CrossingByIdQuery',
    options: ownProps => ({
      variables: {
        crossingId: Number(ownProps.match.params.id),
      },
    }),
  }),
  graphql(AllCommunitiesQuery, {
    name: 'AllCommunitiesQuery',
  }),
)(CrossingDetailPage);
