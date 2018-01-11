import React, { Component } from 'react';
import gql from 'graphql-tag';
import { graphql, compose } from 'react-apollo';
import crossingFragment from 'components/Dashboard/CrossingListPage/queries/crossingFragment';
import FontAwesome from 'react-fontawesome';
import classnames from 'classnames';
import 'components/Dashboard/CrossingDetailPage/CrossingDetails.css';
import { Redirect } from 'react-router';

class CrossingDetails extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: props.crossing.name,
      description: props.crossing.description,
      delete: false,
      redirectToNewCrossingId: null
    };
  }

  updateCrossing = (e) => {

    this.props.updateCrossingMutation({
      variables: {
        crossingId: this.props.crossing.id,
        name: this.state.name,
        description: this.state.description
      },
      update: (store, {data: {editCrossing}}) => {
        const updatedCrossing = editCrossing.crossing;        
        store.writeFragment({
          id: 'Crossing:' + updatedCrossing.id,
          fragment: crossingFragment,
          data: updatedCrossing
        });
      },  
    })
    .then(({ data }) => {
      console.log('success', data);
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  addCrossing = (e) => {

    this.props.addCrossingMutation({
      variables: {
        name: this.state.name,
        humanAddress: this.state.humanAddress,
        description: this.state.description,
        communityId: this.props.currentUser.communityId,
        longitude: this.props.crossing.lng,
        latitude: this.props.crossing.lat
      }
    })
    .then(({ data }) => {
      console.log('success', data);
      const { id } = data.newCrossing.crossing;
      this.setState({redirectToNewCrossingId: id});
    }).catch((error) => {
      console.log('there was an error sending the query', error);
    });
  }

  deleteCrossing = (e) => {
//TODO: add delete functionality    
    console.log('DELETE CROSSING');
  }

  nameChanged = (e) => { 
    this.setState({ 
      name: e.target.value
    });
  }
  descriptionChanged = (e) => { 
    this.setState({ 
      description: e.target.value
    });
  }
  humanAddressChanged = (e) => { 
    this.setState({ 
      humanAddress: e.target.value
    });
  }

  cancelClicked = () => {
    this.setState({
      name: this.props.crossing.name,
      description: this.props.crossing.description
    });
  }
  deleteClicked = () => {
    this.setState({delete: true});
  }
  deleteCancelClicked =() => {
    this.setState({delete: false});
  }

  isDirty() {
    return (
      this.props.crossing.name !== this.state.name ||
      this.props.crossing.description !== this.state.description
    );
  }

  render() {
    // If we finished adding a crossing, we should redirect to the edit page
    if (this.state.redirectToNewCrossingId) {
      return <Redirect push to={`/dashboard/crossing/${this.state.redirectToNewCrossingId}`} />
    }

    const { crossing, communities, addMode } = this.props;

    return (

      <div className={classnames("CrossingDetails", {"dirty-container--dirty":this.isDirty()} ,"dirty-container mlv2 plv2")}>   

        <div className="CrossingDetails__details">
          { !addMode ? (
              <div>
                <div><span className="strong gray--75 mlv1--r">ID#</span> <span className="italic light gray--50">{crossing.id}</span></div>
                <div><span className="strong gray--75 mlv1--r">Address</span> <span className="italic light gray--50">{crossing.humanAddress}</span></div>
              </div>
            ) : null
          }

          <div><span className="strong gray--75 mlv1--r">GPS</span> <span className="italic light gray--50">{crossing.humanCoordinates}</span></div>

          <div className="mlv2--t">
            <div>
              <div><span className="gray--75 mlv1--r">Display Name*</span></div>
              <span className="light gray--25 mlv1--r">Name your crossings by intersections (ie, Onion Creek Blvd. & 5th Ave) or waypoints (5th Ave. Denny's)</span>
            </div>
            <input id="crossingName" className="input input--lg" type="text" value={this.state.name} onChange={this.nameChanged} />
          </div>

          { addMode ? (

            <div className="mlv2--t">
              <div>
                <div><span className="gray--75 mlv1--r">Street Address*</span></div>
                <span className="light gray--25 mlv1--r">The human readable address for the crossing</span>
              </div>

              <input className="input" type="text" value={this.state.humanAddress} onChange={this.humanAddressChanged} />
            </div>
            
          ) : null }

          <div className="mlv2--t">
              <div>
                <div><span className="gray--75 mlv1--r">Additional Description (optional)</span></div>
                <span className="light gray--25 mlv1--r">Does the location need additional clarification? ie, "Southbound lane only"</span>
              </div>
            <input id="crossingDescription" className="input" type="text" value={this.state.description} onChange={this.descriptionChanged} />
          </div>

          <div className="CrossingDetails__communities mlv2--t">
              {
                communities.map((community) => {
                  return (
                    <button 
                      key={community.id} 
                      className="button button--secondary mlv2--r mlv2--b"
                    >{community.name} </button>
                  );
                })
              }
          </div>
        </div>

        {!addMode ? (
          this.isDirty() ? (
            <div className="CrossingDetails__buttons flexcontainer">
              <button 
                className="flexitem button button--cancel mlv2--r"
                onClick={this.cancelClicked}
              >Cancel</button>
              <button 
                className="flexitem button button--confirm mlv2--l" 
                onClick={this.updateCrossing}
              >Save</button>
            </div>
          ) : (
            <div className="CrossingDetails__buttons flexcontainer">
              <button 
                className="button button--plaintext color-highlight"
                onClick={this.deleteClicked}
              >Delete Crossing</button>
            </div>
          )
        ) : (
          <div className="CrossingDetails__buttons flexcontainer">
            <button 
              className="flexitem button button--confirm mlv2--l" 
              onClick={this.addCrossing}
            >Add Crossing</button>
          </div>
        )}

        { this.state.delete && (
          <div className="CrossingDetails__delete overlay-container flexcontainer--center">
            <div className="plv2">
            <p>The historical data for this crossing will be saved, but you will no longer be able to view or change the change this crossing's status</p>
            <p>Do you want to continue?</p>
            <div className="flexcontainer">
              <button 
                className="flexitem button button--cancel mlv2--r"
                onClick={this.deleteCancelClicked}
              >No, Go Back</button>
              <button 
                className="flexitem button button--confirm mlv2--l" 
                onClick={this.deleteCrossing}
              >Yes, Delete</button>
            </div>
            </div>
          </div>
        )}
      </div>
    );
  }

}

/**/

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

const addCrossingMutation = gql`
  mutation addCrossing($name: String!, $humanAddress: String!, $description: String!, $communityId: Int!, $longitude: Float!, $latitude: Float!) {
    newCrossing(input: {name: $name, humanAddress: $humanAddress, description: $description, communityId: $communityId, longitude: $longitude, latitude: $latitude}) {
      crossing {
        id
      }
    }
  }
`;

export default compose(
  graphql(updateCrossingMutation, {
    name: 'updateCrossingMutation'
  }),
  graphql(addCrossingMutation, {
    name: 'addCrossingMutation'
  })
)(CrossingDetails);
