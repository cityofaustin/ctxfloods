import React, { Component } from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import FontAwesome from 'react-fontawesome';

class CrossingMapSearchBar extends Component {
  render() {
    return (
      <div>
        <div className="CrossingMapPage_sidebar-search-header">
          SEARCH FOR A PLACE, AREA, OR CROSSING
        </div>
        <div className="CrossingMapPage_sidebar-search-container">
          <div className="CrossingMapPage_sidebar-search-location-icon">
            <FontAwesome name='map-marker' size='2x'/>  
          </div>
          <div className="CrossingMapPage_sidebar-search-text-entry">
            <input type="text" placeholder="Search..."/>
          </div>
          <div className="CrossingMapPage_sidebar-search-glass-icon">
            <FontAwesome name='search' size='2x'/>  
          </div>
          <div className="CrossingMapPage_sidebar-search-cancel-icon">
            <FontAwesome name='times' size='2x'/>  
          </div>
        </div>
      </div>
    );
  }
}

export default CrossingMapSearchBar;
