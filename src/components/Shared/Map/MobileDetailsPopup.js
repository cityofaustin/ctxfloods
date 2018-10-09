import React from 'react';

import DetailsItem from 'components/Public/CrossingListItem/DetailsItem';

const MobileDetailsPopup = ({ crossing, reasons }) => (
  <div>
    <DetailsItem title="Reason">
      {
        reasons.find(
          r =>
            r.id === crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
        ).name
      }
    </DetailsItem>
  </div>
);

export default MobileDetailsPopup;
