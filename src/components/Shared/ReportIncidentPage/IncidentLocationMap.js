import React, { Component } from 'react';
import PropTypes from 'prop-types';
import ReactMapboxGl, { Layer, Feature, ZoomControl } from 'react-mapbox-gl';

import { MAPBOX_STYLE, MapboxAccessToken } from 'constants/MapboxConstants';

const Map = ReactMapboxGl({
  accessToken: MapboxAccessToken,
});

export default class IncidentLocationMap extends Component {
  static propTypes = {
    coordinates: PropTypes.arrayOf(PropTypes.number).isRequired,
    onCoordinatesChange: PropTypes.func.isRequired,
  };

  onStyleLoad = map => {
    map.resize();
  };

  render() {
    const { coordinates, onCoordinatesChange } = this.props;

    return (
      <Map
        className="IncidentLocationMap"
        // eslint-disable-next-line
        style={MAPBOX_STYLE}
        center={coordinates}
        zoom={[10]}
        onStyleLoad={this.onStyleLoad}
      >
        <Layer
          type="symbol"
          id="newCrossing"
          layout={{
            'icon-image': 'marker-closed-small',
            'icon-allow-overlap': true,
          }}
        >
          <Feature
            coordinates={coordinates}
            draggable={true}
            onDragEnd={onCoordinatesChange}
          />
        </Layer>
        <ZoomControl position="bottom-right" />
      </Map>
    );
  }
}
