import React, { Component } from 'react';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import { statusIcons } from 'constants/StatusConstants';

const Map = ReactMapboxGl({ accessToken: null });

class AddCrossingMap extends Component {

  onStyleLoad = (map) => {
    map.resize();
  }

  render() {
    const coordinates = [-97.46, 30.96];

    return (
        <Map
          className="CrossingStaticMap"
          style={mapboxstyle}
          center={coordinates}
          onStyleLoad = {this.onStyleLoad}
        >
          <Layer
            type="symbol"
            id="openCrossings"
            layout={{ 'icon-image': 'circle-15', 'icon-allow-overlap': true }}
            >            
             <Feature coordinates={coordinates} draggable={true}/>
          </Layer>
        </Map>
    );
  }
}

export default AddCrossingMap;
