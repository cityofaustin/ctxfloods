import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import gql from 'graphql-tag';
import { graphql } from 'react-apollo';

import deleteCrossingFragment from 'components/Dashboard/CrossingListPage/queries/deleteCrossingFragment';

function ConfirmDeleteCrossing({ onCancel, deleteCrossing }) {
  return (
    <div className="CrossingDetails__delete overlay-container flexcontainer--center">
      <div className="plv2">
        <p>
          The historical data for this crossing will be saved, but you will no
          longer be able to view or change the change this crossing’s status
        </p>
        <p>Do you want to continue?</p>
        <div className="flexcontainer">
          <button
            className="flexitem button button--cancel mlv2--r"
            onClick={onCancel}
          >
            No, Go Back
          </button>
          <button
            className="flexitem button button--confirm mlv2--l"
            onClick={deleteCrossing}
          >
            Yes, Delete
          </button>
        </div>
      </div>
    </div>
  );
}

export default class DeleteCrossingButton extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      pendingDelete: false,
    };
  }

  onDelete = () => {
    this.setState({ pendingDelete: true });
  };

  onCancel = () => {
    this.setState({ pendingDelete: false });
  };

  deleteCrossing = e => {
    this.props
      .deleteCrossingMutation({
        variables: {
          crossingId: this.props.crossing.id,
        },
        update: (store, { data: { removeCrossing } }) => {
          const deletedCrossing = removeCrossing.crossing;
          store.writeFragment({
            id: 'Crossing:' + deletedCrossing.id,
            fragment: deleteCrossingFragment,
            data: deletedCrossing,
          });
        },
      })
      .then(({ data }) => {
        console.log('success', data);
        this.setState({ pendingDelete: false });
      })
      .catch(error => {
        // FIXME: Show error
        console.log('there was an error sending the query', error);
      });
  };

  render() {
    return (
      <div>
        <button
          className="button button--plaintext color-highlight"
          onClick={this.onDelete}
        >
          Delete Crossing
        </button>
        {this.props.overlayRef && <div>"hi"</div>}
        {this.props.overlayRef &&
          ReactDOM.createPortal(<ConfirmDeleteCrossing />, this.props.overlayRef)}
      </div>
    );
  }
}

const deleteCrossingMutation = gql`
  mutation deleteCrossingMutation($crossingId: Int!) {
    removeCrossing(input: { crossingId: $crossingId }) {
      crossing {
        id
        active
      }
    }
  }
`;

graphql(deleteCrossingMutation, {
  name: 'deleteCrossingMutation',
})(DeleteCrossingButton);
