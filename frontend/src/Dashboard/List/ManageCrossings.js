import React, { Component } from 'react';
import LinkButton from '../../LinkButton';
import BulkActionsDropdown from '../Table/BulkActionsDropdown';
import TableSearch from '../Table/TableSearch';
import CrossingList from './CrossingList';
import './ManageCrossings.css';

class ManageCrossings extends Component {
  constructor(props) {
    super(props);
    this.state = { searchParam: '' };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.setState({ searchParam: e.target.elements.tableSearch.value });
  }

  render() {
    return (
      <div className="ManageCrossings">
        <div className="flexcontainer">
          <h1 className="ManageCrossings__h1">Manage Crossings</h1>
          <div className="ManageCrossings__right-aligned-element">
            <LinkButton url="/createcrossing" text="Add New" />
          </div>
        </div>
        <div className="flexcontainer">
          <BulkActionsDropdown />
          <div className="ManageCrossings__right-aligned-element">
            <TableSearch handleSubmit={this.handleSubmit} />
          </div>
        </div>
        <CrossingList {...this.props} searchParam={this.state.searchParam} />
      </div>
    );
  }

}


export default ManageCrossings;
