import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';

import CrossingStatusHistorySpreadsheetModal from './CrossingStatusHistorySpreadsheetModal';

export default class CrossingStatusHistorySpreadsheetLink extends Component {
  constructor(...args) {
    super(...args);

    this.state = {
      isModalOpen: false,
    };
  }

  render() {
    return (
      <div
        className="CrossingStatusHistory__download-link"
        onClick={() =>
          this.setState({
            isModalOpen: true,
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
        {this.state.isModalOpen && (
          <CrossingStatusHistorySpreadsheetModal
            onClose={() => {
              console.log('close');
              this.setState({
                isModalOpen: false,
              });
            }}
          />
        )}
      </div>
    );
  }
}
