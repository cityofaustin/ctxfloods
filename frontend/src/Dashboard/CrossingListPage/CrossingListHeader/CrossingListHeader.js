import React, { Component } from 'react';
import './CrossingListHeader.css';
import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';

const query = {
  'fullsize': { minWidth: 768 },
  'smallsize': { maxWidth: 767 }
};

class CrossingListHeader extends Component {
  render() {
    return (
      <ContainerQuery query={query}>
        {(params) => (
          <div className={classnames(params, 'CrossingListHeader')}>
            <input type="text" className={classnames(params, 'CrossingListSearch')} placeholder="Search your crossings"/>
            <div className={classnames(params, 'CrossingListSortToggle')}>SORT</div>
            <div className={classnames(params, 'CrossingListFilter')}>
              FILTER
            </div>
          </div>
        )}
      </ContainerQuery>      
    );
  }

}


export default CrossingListHeader;
