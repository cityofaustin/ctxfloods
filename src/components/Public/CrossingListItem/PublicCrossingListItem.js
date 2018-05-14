import React from 'react';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';

import CrossingCommunityList from 'components/Shared/CrossingListItem/CrossingCommunityList';
import Location from 'components/Shared/CrossingListItem/Location';
import DetailsItem from 'components/Public/CrossingListItem/DetailsItem';
import StatusIcon from 'components/Shared/StatusIcon';
import StatusName from 'components/Shared/StatusName';
import Date from 'components/Shared/DateTime/Date';
import Hour from 'components/Shared/DateTime/Hour';
import * as statusConstants from 'constants/StatusConstants';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';

import 'components/Public/CrossingListItem/PublicCrossingListItem.css';

const containerQuery = {
  'PublicCrossingListItem--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  },
};

class PublicCrossingListItem extends React.Component {
  render() {
    const { crossing, allCommunities, reasons, durations } = this.props;
    const { createdAt } = crossing.statusUpdateByLatestStatusUpdateId;

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

    const CrossingListItemJSX = (
      <div className="PublicCrossingListItem">
        <div className="PublicCrossingListItem__overview">
          <div className="PublicCrossingListItem__status-icon">
            <StatusIcon statusId={crossing.latestStatusId} />
          </div>
          <div className="PublicCrossingListItem__info">
            <div className="PublicCrossingListItem__status-name">
              <StatusName statusId={crossing.latestStatusId} />
            </div>
            <div className="PublicCrossingListItem__crossing-name">
              {crossing.name}
            </div>
            <div>
              <Location crossing={crossing} />
              <CrossingCommunityList crossing={crossing} allCommunities={allCommunities}/>
            </div>
          </div>
          <div className="PublicCrossingListItem__datetime">
            <div className="PublicCrossingListItem__datetime-date">
              <Date date={createdAt} />
            </div>
            <div>
              <Hour date={createdAt} />
            </div>
          </div>
        </div>
        <div className="PublicCrossingListItem__details">
          {show.includes('reason') && (
            <DetailsItem title="Reason">
              {reasons.find(r => r.id === crossing.statusUpdateByLatestStatusUpdateId.statusReasonId).name}
            </DetailsItem>
          )}
          {show.includes('reopen') && (
            <DetailsItem title="Duration">
              {durations.find(r => r.id === crossing.statusUpdateByLatestStatusUpdateId.statusDurationId).name}
            </DetailsItem>
          )}
          {show.includes('notes') && (
            <DetailsItem title="Notes">
              {crossing.statusUpdateByLatestStatusUpdateId.notes}
            </DetailsItem>
          )}
        </div>
      </div>
    );

    if (!this.props.cqClassName) {
      return (
        <ContainerQuery query={containerQuery}>
          {params => (
            <div className={classnames(params)}>{CrossingListItemJSX}</div>
          )}
        </ContainerQuery>
      );
    }

    return (
      <div className={classnames(this.props.cqClassName)}>
        {CrossingListItemJSX}
      </div>
    );
  }
}

export default PublicCrossingListItem;
