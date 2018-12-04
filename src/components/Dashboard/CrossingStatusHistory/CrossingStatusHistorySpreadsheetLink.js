import React, { Component } from 'react';
import PropTypes from 'prop-types';
import FontAwesome from 'react-fontawesome';

import CrossingStatusHistorySpreadsheetModal from './CrossingStatusHistorySpreadsheetModal';

export default class CrossingStatusHistorySpreadsheetLink extends Component {
  static propTypes = {
    crossingId: PropTypes.number,
    communityId: PropTypes.number,
    dateLowerBound: PropTypes.string,
    dateUpperBound: PropTypes.string,
  };

  constructor(...args) {
    super(...args);

    this.state = {
      isOpen: false,
    };
  }

  render() {
    const { crossingId, communityId, dateLowerBound, dateUpperBound } = this.props;

    return (
      <React.Fragment>
        <div
          className="CrossingStatusHistory__download-link"
          onClick={() =>
            this.setState({
              isOpen: true,
            })
          }
          role="button"
        >
          Download
          <div className="CrossingStatusHistory__download-icon">
            <FontAwesome
              size="lg"
              name="download"
              ariaLabel="Download crossing history"
            />
          </div>
        </div>
        {this.state.isOpen && (
          <CrossingStatusHistorySpreadsheetModal
            crossingId={crossingId}
            communityId={communityId}
            dateLowerBound={dateLowerBound}
            dateUpperBound={dateUpperBound}
            onClose={() =>
              this.setState({
                isOpen: false,
              })
            }
          />
        )}
      </React.Fragment>
    );
  }
}
