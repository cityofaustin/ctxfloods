import React, { Component } from 'react';
import CrossingList from 'components/Dashboard/CrossingListPage/CrossingList';
import CrossingListHeader from 'components/Dashboard/CrossingListPage/CrossingListHeader/CrossingListHeader';

class CrossingListPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      sortByUpdatedAsc: false,
      showOpen: true,
      showClosed: true,
      showCaution: true,
      showLongterm: true,
      searchQuery: '',
      formattedSearchQuery: '%'
    };
  }

  formatSearchQuery(query) {
    return `%${query.replace(/ /g,"%")}%`;
  }

  previousPage = (startCursor) => { 
    this.setState({pageCursor: startCursor });
  };

  nextPage = (endCursor) => { 
    this.setState({pageCursor: endCursor });
  };

  toggleShowOpen = () => { this.setState({ showOpen: !this.state.showOpen }) };
  toggleShowClosed = () => { this.setState({ showClosed: !this.state.showClosed }) };
  toggleShowCaution = () => { this.setState({ showCaution: !this.state.showCaution }) };
  toggleShowLongterm = () => { this.setState({ showLongterm: !this.state.showLongterm }) };
  toggleSortByUpdated = () => { this.setState({sortByUpdatedAsc: !this.state.sortByUpdatedAsc }) };
  searchQueryUpdated = (e) => {
    this.setState({ pageCursor: null });
    this.setState({ searchQuery: e.target.value });
    this.setState({ formattedSearchQuery: this.formatSearchQuery(e.target.value) });
  };
  

  render() {
    return (
      <div className="ManageCrossings">
        <CrossingListHeader 
          showOpen={this.state.showOpen}
          toggleShowOpen={this.toggleShowOpen}
          showClosed={this.state.showClosed}
          toggleShowClosed={this.toggleShowClosed}
          showCaution={this.state.showCaution}
          toggleShowCaution={this.toggleShowCaution}
          showLongterm={this.state.showLongterm}
          toggleShowLongterm={this.toggleShowLongterm}
          toggleSortByUpdated={this.toggleSortByUpdated} 
          sortByUpdatedAsc={this.state.sortByUpdatedAsc}
          searchQuery={this.state.searchQuery}
          searchQueryUpdated={this.searchQueryUpdated} />
        <CrossingList {...this.props}
          showOpen={this.state.showOpen}
          showCaution={this.state.showCaution}
          showClosed={this.state.showClosed}
          showLongterm={this.state.showLongterm} 
          sortByUpdatedAsc={this.state.sortByUpdatedAsc}
          searchQuery={this.state.formattedSearchQuery}
          pageCursor={this.state.pageCursor}
          previousPage={this.previousPage}
          nextPage={this.nextPage} />
      </div>
    );
  }

}


export default CrossingListPage;
