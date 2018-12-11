import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';

import CrossingMapPage from 'components/Shared/CrossingMapPage/CrossingMapPage';
import allCrossings from 'components/Shared/Map/queries/allCrossingsQuery';
import allCamerasQuery from 'components/Shared/Map/queries/allCamerasQuery';
import communityFragment from 'components/Shared/Map/queries/communityFragment';
import * as selectors from 'components/Shared/CrossingMapPage/selectors';

class CrossingMapPageContainer extends Component {
  render(){
    const isDataLoaded = selectors.isDataLoaded(this.props);
    return <CrossingMapPage
      {...this.props}
      isDataLoaded={isDataLoaded}
    />
  }
}

const allCommunities = gql`
  {
    allCommunities {
      nodes {
        ...communityInfo
      }
    }
  }
  ${communityFragment}
`;

export default compose(
  graphql(allCrossings, {
    name: 'openCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: true,
        showClosed: false,
        showCaution: false,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'closedCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: true,
        showCaution: false,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'cautionCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: false,
        showCaution: true,
        showLongterm: false,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCrossings, {
    name: 'longtermCrossings',
    options: ownProps => ({
      variables: {
        search: '%%',
        showOpen: false,
        showClosed: false,
        showCaution: false,
        showLongterm: true,
        communityId:
          ownProps.currentUser &&
          ownProps.currentUser.role !== 'floods_super_admin'
            ? ownProps.currentUser.communityId
            : ownProps.selectedCommunityId,
      },
    }),
  }),
  graphql(allCommunities, {
    name: 'allCommunities',
  }),
  graphql(allCamerasQuery, {
    name: 'allCameras'
  })
)(CrossingMapPageContainer);
