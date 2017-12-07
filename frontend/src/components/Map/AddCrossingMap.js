import React, { Component } from 'react';
import ReactMapboxGl, { Marker } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import { statusIcons } from 'constants/StatusConstants';

const Map = ReactMapboxGl({ accessToken: null, interactive: false });

class AddCrossingMap extends Component {

  onStyleLoad = (map) => {
    map.resize();
  }

  render() {
    return (
        <Map
          className="CrossingStaticMap"
          style={mapboxstyle}
          onStyleLoad = {this.onStyleLoad}
        >
        </Map>
    );
  }
}

export default AddCrossingMap;
