import React, { Component } from 'react';
import './CrossingListHeader.css';

class CrossingListHeader extends Component {
  render() {
    return (
      <div className="CrossingListHeader">
      	<input type="text" className="CrossingListSearch" placeholder="Search your crossings"/>
      	<div className="CrossingListSortToggle">SORT</div>
      	<div className="CrossingListFilter">
      		FILTER
      	</div>
      </div>
    );
  }

}


export default CrossingListHeader;
