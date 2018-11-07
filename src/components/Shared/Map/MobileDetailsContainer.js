import React from 'react';

import DetailsItem from 'components/Public/CrossingListItem/DetailsItem';
import * as statusConstants from 'constants/StatusConstants';

import 'components/Shared/Map/MobileDetailsContainer.css';

const MobileDetailsContainer = ({ crossing, reasons }) => {
  var show = [];
  switch (crossing.latestStatusId) {
    case statusConstants.OPEN:
      show = [];
      break;
    case statusConstants.CAUTION:
    case statusConstants.CLOSED:
      show = ['reason', 'notes'];
      break;
    case statusConstants.LONGTERM:
      show = ['reason', 'reopen', 'notes'];
      break;
    default:
      break;
  }

  return (
    <div className="MobileDetails__container">
      {show.includes('reason') && (
        <DetailsItem title="Reason">
          {
            reasons.find(
              r =>
                r.id ===
                crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
            ).name
          }
        </DetailsItem>
      )}
      { show.includes('reopen') && (
        <DetailsItem title="Duration">
          {(crossing.statusUpdateByLatestStatusUpdateId.indefiniteClosure) ?
          ("Closed Indefinitely") :
          (`Expected to Reopen ${crossing.statusUpdateByLatestStatusUpdateId.reopenDate}`)}
        </DetailsItem>
      )}
      {show.includes('notes') && (
        <DetailsItem title="Notes">
          {crossing.statusUpdateByLatestStatusUpdateId.notes}
        </DetailsItem>
      )}
    </div>
  );
};

export default MobileDetailsContainer;
