import React from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';

class CrossingSidebarSearchResultItem extends React.Component {
  render () {
    const { id, latestStatus } = this.props;
    
    return (
      <div className="CrossingMapPage_sidebar-search-result-container">
        <div className="CrossingMapPage_sidebar-search-result-status-icon"/>
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
