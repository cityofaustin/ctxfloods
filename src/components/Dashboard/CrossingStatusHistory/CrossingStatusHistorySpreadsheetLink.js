import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';

import CrossingStatusHistorySpreadsheetModal from './CrossingStatusHistorySpreadsheetModal';

export default class CrossingStatusHistorySpreadsheetLink extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      isOpen: false,
    };
  }

  render() {
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
          History
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
            isOpen={this.state.isOpen}
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
