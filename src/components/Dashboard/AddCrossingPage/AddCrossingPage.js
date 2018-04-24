import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import AddCrossingMap from 'components/Shared/Map/AddCrossingMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';
import formatcoords from 'formatcoords';

class AddCrossingPage extends Component {
  state = {
    crossingCoordinates: [-97.46, 30.96],
  };

  crossingMoved = e => {
    const coords = [e.lngLat.lng, e.lngLat.lat];
    this.setState({ crossingCoordinates: coords });
  };

  render() {

    const isLoading = !this.props.data || this.props.data.loading;

    if (isLoading) {
      return <div>Loading</div>;
    }

    const allCommunities = this.props.data.allCommunities.nodes;

    const crossing = {
      name: null,
      description: null,
      humanCoordinates: formatcoords(
        this.state.crossingCoordinates,
        true,
      ).format({ decimalPlaces: 3 }),
      lng: this.state.crossingCoordinates[0],
      lat: this.state.crossingCoordinates[1],
    };

    const communities = [this.props.currentUser.communityByCommunityId];

    return (
      <div className="AddCrossingPage">
        <div className="CrossingDetails__container">
          <AddCrossingMap
            crossingCoordinates={this.state.crossingCoordinates}
            crossingMoved={this.crossingMoved}
          />
          <CrossingDetails
            crossing={crossing}
            allCommunities={allCommunities}
            crossingCommunities={communities}
            addMode={true}
            currentUser={this.props.currentUser}
          />
        </div>
      </div>
    );
  }
}

const allCommunities = gql`
  query {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`;

export default graphql(allCommunities)(AddCrossingPage);
