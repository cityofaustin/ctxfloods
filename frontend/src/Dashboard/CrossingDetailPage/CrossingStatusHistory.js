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
              <div className="flexitem">
                <DateTime datetime={createdAt} user={user} />
              </div>
              <div className="flexitem flexcontainer">
                <div className="CrossingStatusHistory__item-details">
                  <span>Status: {status}</span>
                </div>
                <div className="CrossingStatusHistory__item-details">
                  { shouldDisplay.reason &&
                      <div className="CrossingStatusHistory__item-subdetails">
                        <span>Reason</span>
                        <span className="strong">{reason}</span>
                      </div>
                  }
                  { shouldDisplay.duration &&
                      <div className="CrossingStatusHistory__item-subdetails">
                        <span>Estimated re-open</span>
                        <span className="strong">{duration}</span>
                      </div>
                  }
                </div>
                <div className="CrossingStatusHistory__item-details">
                  { shouldDisplay.notes &&
                      <div className="CrossingStatusHistory__item-subdetails">
                        <span>Notes to the public</span>
                        <span className="strong">{notes}</span>
                      </div>
                  }
                </div>
              </div>
            </div>
          )
        })}
      </div>
    );
  }
}

export default CrossingStatusHistory;
