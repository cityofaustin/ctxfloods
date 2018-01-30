import React, { Component } from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import FontAwesome from 'react-fontawesome';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

class CrossingMapSearchBar extends Component {

  clearSearch = () => {
    this.props.searchQueryUpdated({target:{value:''}});
    this.props.selectCrossing(null,null);
  }

  render() {
    const { searchQuery, selectedCrossingId, searchQueryUpdated } = this.props;
    const crossingName = 
      (this.props.data && !this.props.data.loading && this.props.data.crossingById) ?
        this.props.data.crossingById.name : null;

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
            <input type="text"
                   placeholder="Search..."
                   value={selectedCrossingId && crossingName ? crossingName : searchQuery}
                   onChange={searchQueryUpdated} />
          </div>
          <div className="CrossingMapPage_sidebar-search-glass-icon">
            <FontAwesome name='search' size='2x'/>  
          </div>
          <div className="CrossingMapPage_sidebar-search-cancel-icon" onClick={this.clearSearch}>
            <FontAwesome name='times' size='2x'/>  
          </div>
        </div>
      </div>
    );
  }
}

const crossingQuery = gql`
  query crossingById($crossingId:Int!) {
    crossingById(id:$crossingId) {
      id
      name
    }
  }
`;

export default graphql(crossingQuery, {
  options: (ownProps) => ({
    variables: {
      crossingId: ownProps.selectedCrossingId
    }
  })
})(CrossingMapSearchBar);
