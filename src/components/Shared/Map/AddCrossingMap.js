import React, { Component } from 'react';
import ReactMapboxGl, { Layer, Feature } from 'react-mapbox-gl';

import { MapboxAccessToken } from 'constants/MapboxConstants';

const Map = ReactMapboxGl({
  accessToken: MapboxAccessToken,
});

class AddCrossingMap extends Component {
  onStyleLoad = map => {
    map.resize();
  };

  render() {
    const { crossingCoordinates, crossingMoved } = this.props;

    return (
      <Map
        className="CrossingStaticMap"
        // eslint-disable-next-line
        style="mapbox://styles/croweatx/cjeynr3z01k492so57s8lo34o"
        center={crossingCoordinates}
        onStyleLoad={this.onStyleLoad}
      >
        <Layer
          type="symbol"
          id="newCrossing"
          layout={{
            'icon-image': 'marker-open-small',
            'icon-allow-overlap': true,
          }}
        >
          <Feature
            coordinates={crossingCoordinates}
            draggable={true}
            onDragEnd={crossingMoved}
          />
        </Layer>
      </Map>
    );
  }
}

export default AddCrossingMap;
