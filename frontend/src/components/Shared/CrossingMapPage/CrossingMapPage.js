import React, { Component } from 'react';
import CrossingMap from 'components/Shared/Map/CrossingMap';
import CrossingMapSidebar from 'components/Shared/CrossingMapPage/CrossingMapSidebar';
import CrossingMapSearchBar from 'components/Shared/CrossingMapPage/CrossingMapSearchBar';
import SelectedCrossingContainer from 'components/Shared/CrossingMapPage/SelectedCrossingContainer';
import 'components/Shared/CrossingMapPage/CrossingMapPage.css';
import Fullscreen from 'react-full-screen';
import FontAwesome from 'react-fontawesome';
import { LARGE_ITEM_MIN_WIDTH } from 'constants/containerQueryConstants';
import { ContainerQuery } from 'react-container-query';

const containerQuery = {
  'fullsize': {
    minWidth: LARGE_ITEM_MIN_WIDTH,
  }
};

class CrossingMapPage extends Component {
  constructor(props) {
    super(props);

    // If we have a current user, we're on the dashboard, we should get their viewport
    const envelope = this.props.currentUser ? 
      JSON.parse(this.props.currentUser.communityByCommunityId.viewportgeojson) :
      JSON.parse(`{"type":"Polygon","coordinates":[[[-98.086914,30.148464],[-98.086914,30.433285],[-97.615974,30.433285],[-97.615974,30.148464],[-98.086914,30.148464]]]}`);
    
    // I actually like doing the padding here because it keeps the data/view separation
    const viewport = [
      [Math.min(...envelope.coordinates[0].map(arr => arr[0])) - 0.1, Math.min(...envelope.coordinates[0].map(arr => arr[1])) - 0.1],
      [Math.max(...envelope.coordinates[0].map(arr => arr[0])) + 0.1, Math.max(...envelope.coordinates[0].map(arr => arr[1])) + 0.1]
    ];

    this.state = {
      viewport: viewport,
      selectedCrossingId: null,
      selectedCrossingStatus: null,
      fullscreen: false
    };
  }

  selectCrossing = (crossingId, crossingStatus) => {
    this.setState({selectedCrossingId: crossingId});
    this.setState({selectedCrossingStatus: crossingStatus});
  }

  toggleFull = () => {
    this.setState({fullscreen: !this.state.fullscreen});
  }

  render() {
    const { viewport, selectedCrossingId, selectedCrossingStatus } = this.state;
    const { currentUser } = this.props;

    return (

      <ContainerQuery query={containerQuery}>
      {(params) => (
        <div className="CrossingMapPage__page-container">        
          <Fullscreen enabled={this.state.fullscreen} onChange={fullscreen => this.setState({fullscreen})}>
            <div className="CrossingMapPage">
              {!params.fullsize && <CrossingMapSearchBar selectedCrossingId={selectedCrossingId}/>}
              {params.fullsize && <div className="CrossingMapPage__fullscreen-toggle-container">
                <FontAwesome name='arrows-alt' size='2x' onClick={this.toggleFull} className='CrossingMapPage__fullscreen-toggle'/>
              </div>}
              {params.fullsize && <CrossingMapSidebar selectedCrossingId={selectedCrossingId} currentUser={currentUser} selectCrossing={this.selectCrossing}/>}
              <div className="CrossingMapPage__map-container">
                <CrossingMap 
                  mapHeight="100%"
                  mapWidth="100%"
                  viewport={viewport}
                  selectedCrossingId={selectedCrossingId}
                  selectedCrossingStatus={selectedCrossingStatus}
                  selectCrossing={this.selectCrossing}
                  currentUser={currentUser} />
              </div>
              {!params.fullsize && selectedCrossingId && <SelectedCrossingContainer crossingId={selectedCrossingId} currentUser={currentUser} selectCrossing={this.selectCrossing}/>}
            </div>
          </Fullscreen>
        </div>      
      )}
      </ContainerQuery>
    );
  }
}

export default CrossingMapPage;


