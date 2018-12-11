import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import AddCrossingMap from 'components/Shared/Map/AddCrossingMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';
import formatcoords from 'formatcoords';

class AddCrossingPage extends Component {
  startLat = 30.96;
  startLng = -97.46;
  minLng = -124;
  maxLng = -66;
  minLat = 25;
  maxLat = 49;

  state = {
    lat: this.startLat,
    lng: this.startLng,
    // key updates LatLngInput form if coordinates change from dragging marker on map
    // lets us toggle from a fully controlled component to an uncontrolled component
    latLngInputKey: new Date().toISOString(),
  };

  crossingMoved = e => {
    const {lat, lng} = e.lngLat;
    if (
      (lat > this.minLat) &&
      (lat < this.maxLat) &&
      (lng > this.minLng) &&
      (lng < this.maxLng)
    ) {
      this.setState({
        lat: e.lngLat.lat,
        lng: e.lngLat.lng,
        latLngInputKey: new Date().toISOString(),
      });
    } else {
      setTimeout(()=>{
        // Mapbox's onDragEnd is async. Need to wait before triggering another coordinate change.
        this.setState({
          lat: this.startLat,
          lng: this.startLng,
          latLngInputKey: new Date().toISOString(),
        })
      }, 50);
    }
  };

  latLngInputChanged = ({lat, lng}) => {
    this.setState({lat, lng})
  }

  render() {
    const isLoading = !this.props.data || this.props.data.loading;
    const {lat, lng, latLngInputKey} = this.state;

    if (isLoading) {
      return <div>Loading</div>;
    }

    const allCommunities = this.props.data.allCommunities.nodes;

    const crossing = {
      name: null,
      description: null,
      humanCoordinates: formatcoords(
        [lng, lat],
        true,
      ).format({ decimalPlaces: 3 }),
      lng,
      lat,
    };

    const communities = [this.props.currentUser.communityByCommunityId];

    return (
      <div className="AddCrossingPage">
        <div className="CrossingDetails__container">
          <AddCrossingMap
            lat={lat} lng={lng}
            crossingMoved={this.crossingMoved}
          />
          <CrossingDetails
            crossing={crossing}
            allCommunities={allCommunities}
            crossingCommunities={communities}
            addMode={true}
            currentUser={this.props.currentUser}
            minLat={this.minLat}
            maxLat={this.maxLat}
            minLng={this.minLng}
            maxLng={this.maxLng}
            latLngInputKey={latLngInputKey}
            latLngInputChanged={this.latLngInputChanged}
          />
        </div>
      </div>
    );
  }
}

const allCommunities = gql`
  query allCommunities {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`;

export default graphql(allCommunities)(AddCrossingPage);
