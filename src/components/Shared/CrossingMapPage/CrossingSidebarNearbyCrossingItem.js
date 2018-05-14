import React from 'react';
import { withRouter } from 'react-router';

import { statusNames, statusIcons } from 'constants/StatusConstants';
import Date from 'components/Shared/DateTime/Date';
import Hour from 'components/Shared/DateTime/Hour';
import CrossingCommunityList from 'components/Shared/CrossingListItem/CrossingCommunityList';

import 'components/Shared/CrossingMapPage/CrossingSidebarNearbyCrossingItem.css';

class CrossingSidebarNearbyCrossingItem extends React.Component {
  render() {
    const {
      latestStatus,
      statusId,
      crossingId,
      crossing,
      crossingName,
      allCommunities
    } = this.props;

    return (
      <div
        className="CrossingMapPage_sidebar-nearby-crossing-container"
        onClick={() => this.props.history.push(`/map/crossing/${crossingId}`)}
      >
        <div className="CrossingMapPage_sidebar-nearby-crossing-status-icon">
          <img
            src={statusIcons[statusId]}
            alt={statusNames[statusId]}
            className="CrossingStatusHistory__status-icon"
          />
        </div>
        <div className="CrossingMapPage_sidebar-nearby-crossing-details">
          <div className="CrossingMapPage_sidebar-nearby-crossing-details-status">
            {statusNames[statusId]}
          </div>
          <div className="CrossingMapPage_sidebar-nearby-crossing-details-name">
            {crossingName}
          </div>
          <div className="CrossingMapPage_sidebar-nearby-crossing-details-communities">
            <CrossingCommunityList crossing={crossing} allCommunities={allCommunities}/>
          </div>
        </div>
        <div className="CrossingMapPage_sidebar-nearby-crossing-update-datetime">
          <div className="CrossingMapPage_sidebar-nearby-crossing-update-datetime-date">
            <Date date={latestStatus} />
          </div>
          <div className="CrossingMapPage_sidebar-nearby-crossing-update-datetime-time">
            <Hour date={latestStatus} />
          </div>
        </div>
      </div>
    );
  }
}

export default withRouter(CrossingSidebarNearbyCrossingItem);
