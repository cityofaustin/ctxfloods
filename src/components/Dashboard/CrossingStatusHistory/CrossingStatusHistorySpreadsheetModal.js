import { graphql } from 'react-apollo';
import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { get, size } from 'lodash';
import { CSVLink } from 'react-csv';
import FontAwesome from 'react-fontawesome';

import { logError } from 'services/logger';
import Modal from 'components/Shared/Modal';
import ModalErrorMessage from 'components/Shared/Modal/ModalErrorMessage';
import ButtonSecondary from 'components/Shared/Button/ButtonSecondary';
import StatusHistoryQuery from 'components/Dashboard/CrossingListPage/queries/statusHistoryQuery';

import './CrossingStatusHistorySpreadsheetLink.css';

class CrossingStatusHistorySpreadsheetModal extends Component {
  static propTypes = {
    data: PropTypes.object,
    onClose: PropTypes.func.isRequired,
    crossingId: PropTypes.number,
    communityId: PropTypes.number,
    dateLowerBound: PropTypes.string,
    dateUpperBound: PropTypes.string,
  };

  constructor(...args) {
    super(...args);

    this.state = {
      errorMessage: null,
    };
  }

  componentDidCatch(err) {
    logError(err);
    this.setState({ errorMessage: err.message });
  }

  generateCsv() {
    try {
      const loading = !this.props.data || this.props.data.loading;
      if (loading) return 'loading';

      const history = this.props.data.getStatusUpdateHistory.edges;

      const headers = [
        [
          'Crossing Name',
          'Crossing Address',
          'Date & Time',
          'Status',
          'Reason',
          'Open Date',
          'Closed Indefinitely',
          'Notes',
          'Community Ids'
        ],
      ];

      return headers.concat(
        history.map(update => {
          const {
            crossingName,
            crossingHumanAddress,
            createdAt,
            statusName,
            statusReasonName,
            reopenDate,
            indefiniteClosure,
            notes,
            communityIds
          } = update.node;

          return [
            crossingName,
            crossingHumanAddress,
            createdAt,
            statusName,
            statusReasonName,
            reopenDate,
            indefiniteClosure,
            notes,
            communityIds.join(', ')
          ];
        }),
      );
    } catch (err) {
      logError(err);
      this.setState({ errorMessage: err.message });
    }
  }

  render() {
    const { loading } = !this.props.data || this.props.data.loading;

    const rowCount = size(get(this, 'props.data.getStatusUpdateHistory.edges', []));
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
        {!loading &&
          !this.state.errorMessage &&
          rowCount && <p>Generated CSV file with {rowCount} rows.</p>}
        {this.state.errorMessage && (
          <ModalErrorMessage>{this.state.errorMessage}</ModalErrorMessage>
        )}
      </Modal>
    );
  }
}

export default graphql(StatusHistoryQuery, {
  options: ownProps => ({
    variables: {
      communityId: ownProps.communityId,
      crossingId: ownProps.crossingId,
      dateLowerBound: ownProps.dateLowerBound,
      dateUpperBound: ownProps.dateUpperBound,
      idUpperBound: null,
      rowLimit: null
    }
  }),
})(CrossingStatusHistorySpreadsheetModal);
