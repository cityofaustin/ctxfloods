import React from 'react';

import DetailsItem from 'components/Public/CrossingListItem/DetailsItem';
import 'components/Shared/Map/MobileDetailsPopup.css';

const MobileDetailsPopup = ({ crossing, reasons, durations }) => (
  <div className="MobileDetails__container">
    <DetailsItem title="Reason">
      {
        reasons.find(
          r =>
            r.id === crossing.statusUpdateByLatestStatusUpdateId.statusReasonId,
        ).name
      }
    </DetailsItem>
    <DetailsItem title="Duration">
      {
        durations.find(
          d =>
            d.id ===
            crossing.statusUpdateByLatestStatusUpdateId.statusDurationId,
        ).name
      }
    </DetailsItem>
    <DetailsItem title="Notes">
      {crossing.statusUpdateByLatestStatusUpdateId.notes}
    </DetailsItem>
  </div>
);

export default MobileDetailsPopup;
