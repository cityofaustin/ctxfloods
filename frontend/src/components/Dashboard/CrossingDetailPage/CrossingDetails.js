import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';
import ReactMapboxGl, { Layer, Feature } from "react-mapbox-gl";
import mapboxstyle from 'components/Map/mapboxstyle.json';
import FontAwesome from 'react-fontawesome';
import 'components/Dashboard/CrossingDetailPage/CrossingDetails.css';

const Map = ReactMapboxGl({ accessToken: null, interactive: false });

class CrossingDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: props.crossing.name,
      description: props.crossing.description,
      edit: false
    };
  }

  updateCrossing = (e) => {
    this.props.updateCrossingMutation({
      variables: {
        crossingId: this.props.crossing.id,
        name: this.state.name,
        description: this.state.description
      }
    })
    .then(({ data }) => {
      // TODO - handle success
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  nameChanged         = (e) => { this.setState({ name: e.target.value }) };
  descriptionChanged  = (e) => { this.setState({ description: e.target.value }) };
  setEditModeTrue     = () => { this.setState({ edit: true }) };
  setEditModeFalse    = () => { this.setState({ edit: false }) };

  render() {
    const { crossing, communities } = this.props;

    return (
      <div className="CrossingDetails">

        <Map
          className="CrossingDetails__map"
          center={JSON.parse(crossing.geojson).coordinates}
          style={mapboxstyle}
          containerStyle={{
            height: "300px"
          }}>
            <Layer
              type="symbol"
              id="marker"
              layout={{'icon-image':'circle-15'}}
            >
              <Feature coordinates={JSON.parse(crossing.geojson).coordinates}/>
            </Layer>
        </Map>



        <div>Crossing Details: {crossing.id}</div>
        <div> {crossing.humanCoordinates} </div>
        <input type="text" value={this.state.name} onChange={this.nameChanged}/>
        <div> {crossing.humanAddress} </div>
        <input type="text" value={this.state.description} onChange={this.descriptionChanged}/>
        <div>{communities.map(c => c.name)}</div>
        <button onClick={this.updateCrossing}> SAVE CROSSING </button>
        <div> CANCEL EDITS </div>
        <div> DELETE CROSSING </div>
      </div>
    );
  }

}

const updateCrossingMutation = gql`
  mutation editCrossing($crossingId: Int!, $name: String!, $description: String!) {
    editCrossing(input: {crossingId: $crossingId, name: $name, description: $description}) {
      crossing {
        id
        name
        description
      }
    }
  }
`;

export default graphql(updateCrossingMutation, { name: 'updateCrossingMutation' })(CrossingDetails);
