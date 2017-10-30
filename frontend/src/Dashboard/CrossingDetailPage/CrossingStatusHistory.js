import React, { Component } from 'react';
import { get } from 'lodash';
import { displayedInputs } from '../../constants/StatusConstants';
// TODO: DateTime component should live in a better place for shared use. Waiting
//       for Brian's Cleanup PR.
import DateTime from '../CrossingListPage/CrossingListItem/DateTime';
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
          const user = get(update, 'userByCreatorId', {});
          const statusId = get(update, 'statusByStatusId.id', '--');
          const status = get(update, 'statusByStatusId.name', '--');
          const reason = get(update, 'statusReasonByStatusReasonId.name', 'Unconfirmed');
          const duration = get(update, 'statusDurationByStatusDurationId.name', '--');
          const createdAt = get(update, 'createdAt', '--');
          const notes = update.notes ? update.notes : '--';
          const shouldDisplay = displayedInputs[statusId];

          return (
            <div className="CrossingStatusHistory__item" key={i}>
              <div className="CrossingStatusHistory__item-details">
                <DateTime datetime={createdAt} user={user} />
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
