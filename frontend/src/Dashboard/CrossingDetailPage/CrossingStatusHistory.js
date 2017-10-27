import React, { Component } from 'react';
import moment from 'moment';
import { get } from 'lodash';
import { displayedInputs } from '../../constants/StatusConstants';
import './CrossingStatusHistory.css';

class CrossingStatusHistory extends Component {
  render() {
    const { history } = this.props;

    return (
      <div className="CrossingStatusHistory">
        <h2 className="CrossingStatusHistory__section-header">
          Crossing History
        </h2>
        {history.map((update, i) => {
          const firstName = get(update, 'userByCreatorId.firstName', '--');
          const lastName = get(update, 'userByCreatorId.lastName', '--');
          const statusId = get(update, 'statusByStatusId.id', '--');
          const status = get(update, 'statusByStatusId.name', '--');
          const reason = get(update, 'statusReasonByStatusReasonId.name', 'Unconfirmed');
          const duration = get(update, 'statusDurationByStatusDurationId.name', '--');
          const createdAt = get(update, 'createdAt', '--');
          const notes = update.notes ? update.notes : '--';
          const timestamp = moment(createdAt).format("MM/DD/YY h:mm A");
          const shouldDisplay = displayedInputs[statusId];

          return (
            <div className="CrossingStatusHistory__item" key={i}>
              <div className="CrossingStatusHistory__item-details">
                <p>{timestamp}</p>
                <p>{`${firstName} ${lastName}`}</p>
                <p>Status: {status}</p>
              </div>
              <div className="CrossingStatusHistory__item-details">
                { shouldDisplay.reason &&
                    <div>
                      <p>Reason</p>
                      <p className="strong">{reason}</p>
                    </div>
                }
                { shouldDisplay.duration &&
                    <div>
                      <p>Estimated re-open</p>
                      <p className="strong">{duration}</p>
                    </div>
                }
              </div>
              <div className="CrossingStatusHistory__item-details">
                { shouldDisplay.notes &&
                  <div>
                    <p>Notes to the public</p>
                    <p className="strong">{notes}</p>
                  </div>
                }
              </div>
            </div>
          )
        })}
      </div>
    );
  }
}

export default CrossingStatusHistory;
