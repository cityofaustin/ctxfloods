import React, { Component } from 'react';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import classnames from 'classnames';

const Map = ReactMapboxGl({ accessToken: null, interactive: false });

class CrossingStaticMap extends Component {

  render() {
    return (
        <Map
          className={classnames("CrossingStaticMap", this.props.className)}
          center={JSON.parse(this.props.crossing.geojson).coordinates}
          style={mapboxstyle}
        >
          <Layer
            type="symbol"
            id="marker"
            layout={{'icon-image':'circle-15'}}
          >
            <Feature coordinates={JSON.parse(this.props.crossing.geojson).coordinates}/>
          </Layer>
        </Map>
    );
  }
}

export default CrossingStaticMap;