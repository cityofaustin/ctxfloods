import React from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import { strings, statusIcons } from 'constants/StatusConstants';

class CrossingSidebarSearchResultItem extends React.Component {
  render () {
    const { id, latestStatus, statusId, crossingName } = this.props;
    
    return (
      <div className="CrossingMapPage_sidebar-search-result-container">
        <div className="CrossingMapPage_sidebar-search-result-status-icon">
          <img src={statusIcons[statusId]} alt={strings[statusId]} className="CrossingStatusHistory__status-icon" />
        </div>
        <div className="CrossingMapPage_sidebar-search-result-details">
          <div className="CrossingMapPage_sidebar-search-result-details-status">{strings[statusId]}</div>
          <div className="CrossingMapPage_sidebar-search-result-details-name">{crossingName}</div>
          <div className="CrossingMapPage_sidebar-search-result-details-communities">TODO: Communities</div>
        </div>
        <div className="CrossingMapPage_sidebar-search-result-update-time">Latest Status: {latestStatus}</div>
      </div>
    );
  }
}

export default CrossingSidebarSearchResultItem;
