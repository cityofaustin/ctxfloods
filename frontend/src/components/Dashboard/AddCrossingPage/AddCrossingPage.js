import React, { Component } from 'react';
import { graphql, compose } from 'react-apollo';
import gql from 'graphql-tag';
import AddCrossingMap from 'components/Map/AddCrossingMap';
import CrossingDetails from 'components/Dashboard/CrossingDetailPage/CrossingDetails';
import CrossingStatusHistory from 'components/Dashboard/CrossingDetailPage/CrossingStatusHistory';
import { ContainerQuery } from 'react-container-query';
import classnames from 'classnames';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import 'components/Dashboard/CrossingDetailPage/CrossingDetailPage.css';

const containerQuery = {
  'CrossingDetails__container--lg': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  }
};

class AddCrossingPage extends Component {
  render() {
    const crossing = {
      name: null,
      description: null
    };

    const communities = [
      {
        name: 'blarg'
      }
    ];

    return (
      <ContainerQuery query={containerQuery}>
        {(params) => (
          <div className="AddCrossingPage">
            <div className={classnames(params, "CrossingDetails__container mlv2--b")}>
              <AddCrossingMap/>
              <CrossingDetails crossing={crossing} communities={communities} addMode={true}/>
            </div>
          </div>
        )}
      </ContainerQuery>
    );
  }
}

export default AddCrossingPage;
