import React, { Component } from 'react';
import ReactMapboxGl, { Marker } from 'react-mapbox-gl';

import StatusIcon from 'components/Shared/StatusIcon';
import { MAPBOX_STYLE, MapboxAccessToken } from 'constants/MapboxConstants';

const Map = ReactMapboxGl({
  accessToken: MapboxAccessToken,
  interactive: false,
});

class CrossingStaticMap extends Component {
  onStyleLoad = map => {
    map.resize();
  };

  render() {
    const coordinates = JSON.parse(this.props.crossing.geojson).coordinates;
    const statusId = this.props.crossing.statusByLatestStatusId.id;
    const status = this.props.crossing.statusByLatestStatusId.name;

    return (
      <Map
        className="CrossingStaticMap"
        center={coordinates}
        // eslint-disable-next-line
        style={MAPBOX_STYLE}
        onStyleLoad={this.onStyleLoad}
      >
        <Marker coordinates={coordinates} anchor="bottom">
          <StatusIcon statusId={statusId} alt={status} />
        </Marker>
      </Map>
    );
  }
}

export default CrossingStaticMap;
