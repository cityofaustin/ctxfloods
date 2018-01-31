import React from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import { statusIcons } from 'constants/StatusConstants';

class CrossingSidebarSearchResultItem extends React.Component {
  render () {
    const { id, latestStatus, statusId } = this.props;
    
    return (
      <div className="CrossingMapPage_sidebar-search-result-container">
        <div className="CrossingMapPage_sidebar-search-result-status-icon">
          <img src={statusIcons[statusId]} alt={statusId} className="CrossingStatusHistory__status-icon" />
        </div>
        <div className="CrossingMapPage_sidebar-search-result-details">
          Crossing Id: {id}
          Latest Status: {latestStatus}
        </div>
        <div className="CrossingMapPage_sidebar-search-result-update-time"/>
      </div>
    );
  }
}

export default CrossingSidebarSearchResultItem;
