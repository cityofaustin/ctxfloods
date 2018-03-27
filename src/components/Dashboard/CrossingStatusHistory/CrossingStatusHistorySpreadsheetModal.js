import { graphql } from 'react-apollo';
import statusHistoryQuery from 'components/Dashboard/CrossingListPage/queries/statusHistoryQuery';
import React, { Component } from 'react';
import { get } from 'lodash';
import { CSVLink } from 'react-csv';
import FontAwesome from 'react-fontawesome';

import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';

import './CrossingStatusHistorySpreadsheetLink.css';

class CrossingStatusHistorySpreadsheetLink extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      errorMessage: null,
    };
  }

  generateCsv() {
    try {
      const { crossingId } = this.props;
      const loading = !this.props.data || this.props.data.loading;
      if (loading) return 'loading';

      const history = this.props.data.allStatusUpdates.edges;

      const headers = crossingId
        ? [['Date & Time', 'Status', 'Reason', 'Duration', 'Notes']]
        : [
            [
              'Crossing Name',
              'Crossing Address',
              'Date & Time',
              'Status',
              'Reason',
              'Duration',
              'Notes',
            ],
          ];

      return headers.concat(
        history.map(update => {
          const status = get(update, 'node.statusByStatusId.name');
          const reason = get(
            update,
            'node.statusReasonByStatusReasonId.name',
            '',
          );
          const duration = get(
            update,
            'node.statusDurationByStatusDurationId.name',
            '',
          );
          const createdAt = get(update, 'node.createdAt');
          const crossingName = get(update, 'node.crossingByCrossingId.name');
          const crossingAddress = get(
            update,
            'node.crossingByCrossingId.humanAddress',
          );
          const notes = get(update, 'node.notes', '');

          return crossingId
            ? [createdAt, status, reason, duration, notes]
            : [
                crossingName,
                crossingAddress,
                createdAt,
                status,
                reason,
                duration,
                notes,
              ];
        }),
      );
    } catch (err) {
      console.error(err);
      this.setState({ errorMessage: err.message });
    }
  }

  render() {
    const { loading } = !this.props.data || this.props.data.loading;

    return (
      <Modal
        title="Crossing History CSV"
        isOpen
        onClose={this.props.onClose}
        footer={
          <div>
            {!loading &&
              !this.state.errorMessage && (
                <CSVLink
                  className="Shared__button Shared__button--primary CrossingStatusHistorySpreadsheetLink__download-button"
                  filename={'statusHistory.csv'}
                  data={this.generateCsv()}
                >
                  Download CSV
                </CSVLink>
              )}
            <ButtonSecondary onClick={this.props.onClose}>
              Cancel
            </ButtonSecondary>
          </div>
        }
      >
        {loading && (
          <div>
            <p>Loading CSV</p>
            <div>
              <FontAwesome name="spinner" size="lg" className="fa-spin" />
            </div>
          </div>
        )}
        {this.state.errorMessage && (
          <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

export default graphql(statusHistoryQuery, {
  options: ownProps => ({
    variables: ownProps.crossingId ? { crossingId: ownProps.crossingId } : {},
  }),
})(CrossingStatusHistorySpreadsheetLink);
