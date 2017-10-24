import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';

class CrossingDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: props.crossing.name,
      description: props.crossing.description
    };
  }

  updateCrossing(e) {
    debugger;
    this.props.updateCrossingMutation({
      variables: {
        crossingId: this.props.crossing.id,
        name: this.state.name,
        description: this.state.description
      }
    })
    .then(({ data }) => {
      alert(data);
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  nameChanged = (e) => { this.setState({ name: e.target.value }) };
  descriptionChanged = (e) => { this.setState({ description: e.target.value }) };

  render() {
    const { crossing, community } = this.props;

    return (
      <div>
        <div>Crossing Details: {crossing.id}</div>
        <div> {crossing.humanCoordinates} </div>
        <input type="text" value={this.state.name} onChange={this.nameChanged}/>
        <div> {crossing.humanAddress} </div>
        <input type="text" value={this.state.description} onChange={this.descriptionChanged}/>
        <div>{community.name}</div>
        <button onClick={this.updateCrossing.bind(this)}> SAVE CROSSING </button>
        <div> CANCEL EDITS </div>
        <div> DELETE CROSSING </div>
      </div>
    );
  }

}

const updateCrossingMutation = gql`
  mutation editCrossing($crossingId: Int!, $name: String!) {
    editCrossing(input: {crossingId: $crossingId, name: $name}) {
      crossing {
        id
        name
      }
    }
  }
`;

export default graphql(updateCrossingMutation, { name: 'updateCrossingMutation' })(CrossingDetails);
