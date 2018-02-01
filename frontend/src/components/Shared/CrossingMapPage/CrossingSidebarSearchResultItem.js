import React from 'react';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import { strings, statusIcons } from 'constants/StatusConstants';
import moment from 'moment';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

class CrossingSidebarSearchResultItem extends React.Component {
  render () {
    const { id, latestStatus, statusId, crossingName, communityIds } = this.props;
    
    const allCommunites = 
      (this.props.data && !this.props.data.loading && this.props.data.allCommunities) ?
        this.props.data.allCommunities.nodes : null;

    return (
      <div className="CrossingMapPage_sidebar-search-result-container">
        <div className="CrossingMapPage_sidebar-search-result-status-icon">
          <img src={statusIcons[statusId]} alt={strings[statusId]} className="CrossingStatusHistory__status-icon" />
        </div>
        <div className="CrossingMapPage_sidebar-search-result-details">
          <div className="CrossingMapPage_sidebar-search-result-details-status">{strings[statusId]}</div>
          <div className="CrossingMapPage_sidebar-search-result-details-name">{crossingName}</div>
          <div className="CrossingMapPage_sidebar-search-result-details-communities">
            { allCommunites && communityIds.map(id => (allCommunites.find(c => c.id === id).name)).join(", ") } 
          </div>
        </div>
        <div className="CrossingMapPage_sidebar-search-result-update-datetime">
          <div className="CrossingMapPage_sidebar-search-result-update-datetime-date">
            {
              moment(latestStatus).calendar(null, {
                lastDay: '[Yesterday]',
                sameDay: '[Today]',
                sameElse: 'MM/DD/YYYY'
              })
            }
          </div>
          <div className="CrossingMapPage_sidebar-search-result-update-datetime-time">
            {
              moment(latestStatus).format('h:mm A')
            }
          </div>
        </div>
      </div>
    );
  }
}

const allCommunities = gql`
  {
    allCommunities {
      nodes {
        id
        name
      }
    }
  }
`;

export default graphql(allCommunities)(CrossingSidebarSearchResultItem);
