import React, { Component } from 'react';
import SelectedCrossingContainer from 'components/Shared/CrossingMapPage/SelectedCrossingContainer';
import CrossingMapSearchBar from 'components/Shared/CrossingMapPage/CrossingMapSearchBar';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import FontAwesome from 'react-fontawesome';

class CrossingMapSidebar extends Component {
  constructor(props) {
    super(props);

    this.state = {
      visible: true,
    };
  }

  toggleSidebar = () => {
    this.setState({visible: !this.state.visible});
  }

  render() {
    const { visible } = this.state;
    const { selectedCrossingId, currentUser, selectCrossing } = this.props;

    return (
      <div className="CrossingMapPage_sidebar-container">{visible && (
        <div className="CrossingMapPage_sidebar-content">
          <CrossingMapSearchBar />
          {selectedCrossingId && <SelectedCrossingContainer crossingId={selectedCrossingId} currentUser={currentUser} selectCrossing={selectCrossing}/> }
        </div>
        )}
        <div className="CrossingMapPage_sidebar-toggle" onClick={this.toggleSidebar}>
          { visible ?
            <FontAwesome name='angle-left' size='2x' onClick={this.toggleSidebar}/> : 
            <FontAwesome name='angle-right' size='2x' onClick={this.toggleSidebar}/>
          }
        </div>
      </div>
    );
  }
}

export default CrossingMapSidebar;
