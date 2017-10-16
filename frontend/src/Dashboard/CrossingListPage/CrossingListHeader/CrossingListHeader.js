import React, { Component } from 'react';
import './CrossingListHeader.css';
import {ContainerQuery} from 'react-container-query';
import classnames from 'classnames';
import FontAwesome from 'react-fontawesome';

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
            <div className={classnames(params, 'CrossingListSearch')}>
              <input type="text" className={classnames(params, 'CrossingListSearchInput')} placeholder="Search your crossings"/>
              <div className={classnames(params, 'CrossingListSearchButton')}>
                <FontAwesome name="search" />
              </div>
            </div>
            <div className={classnames(params, 'CrossingListSortToggle')}>
              LAST UPDATED <FontAwesome name="caret-up" />
            </div>
            <div className={classnames(params, 'CrossingListFilter')}>
              <input type='checkbox'/>Open
              <input type='checkbox'/>Caution
              <input type='checkbox'/>Closed
              <input type='checkbox'/>Long Term Closure
            </div>
          </div>
        )}
      </ContainerQuery>      
    );
  }

}


export default CrossingListHeader;
