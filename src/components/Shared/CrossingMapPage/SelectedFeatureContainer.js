import React from 'react';
import { Layer, Feature, Popup } from 'react-mapbox-gl';

import SelectedCrossingContainer from 'components/Shared/CrossingMapPage/SelectedCrossingContainer';
import * as statusConstants from 'constants/StatusConstants';

export default function SelectedFeatureContainer(props){
  const {
    selectedFeature,
    iconSize,
    mobile,
    showDetailsOnMobile,
    setShowDetailsOnMobile,
    setDetailsHeight,
    onDash,
  } = props;

  let featureProperties, featureCoordinates, layerId, iconImage, popupComponent;
  // iconImages are taken from mapbox

  if (selectedFeature) {
    if (selectedFeature.type === "Crossing") {
      const selectedCrossing = selectedFeature.data;
      switch(selectedCrossing.latestStatusId) {
        case statusConstants.OPEN:
          layerId = "selectedOpenCrossing";
          iconImage = `marker-open-${iconSize}`;
          break;
        case statusConstants.CLOSED:
          layerId = "selectedClosedCrossing";
          iconImage = `marker-closed-${iconSize}`;
          break;
        case statusConstants.CAUTION:
          layerId = "selectedCautionCrossing";
          iconImage = `marker-caution-${iconSize}`;
          break;
        case statusConstants.LONGTERM:
          layerId = "selectedLongtermCrossing";
          iconImage = `marker-long-term-${iconSize}`;
          break;
        default:
          return null;
      }
      featureCoordinates = selectedCrossing.coordinates;
      featureProperties = {
        latestStatusId: selectedCrossing.latestStatusId,
        crossingId: selectedCrossing.id,
        geojson: selectedCrossing.geojson,
      }
      popupComponent = (
        <Popup
          coordinates={featureCoordinates}
          anchor="bottom"
        >
          <div>
            {selectedCrossing.name}
            {(mobile && !showDetailsOnMobile &&
              selectedCrossing.latestStatusId !== statusConstants.OPEN
            ) && (
              <button onClick={() => setShowDetailsOnMobile()}>
                Details
              </button>
            )}
            {showDetailsOnMobile && (
              <SelectedCrossingContainer
                crossingId={selectedCrossing.id}
                isMobileDetails={true}
                onDash={onDash}
                setHeight={(
                  crossingId,
                  statusReasonId,
                  reopenDate,
                  indefiniteClosure,
                  notes,
                ) =>
                  setDetailsHeight(
                    crossingId,
                    statusReasonId,
                    reopenDate,
                    indefiniteClosure,
                    notes,
                  )
                }
              />
            )}
          </div>
        </Popup>
      );
    } else if (selectedFeature.type === "Camera") {
      const selectedCamera = selectedFeature.data;
      layerId = 'selectedCamera';
      iconImage = `camera-${iconSize}`;
      featureCoordinates = selectedCamera.coordinates;
      featureProperties = {
        cameraId: selectedCamera.id,
        geojson: selectedCamera.geojson,
        cameraName: selectedCamera.name,
      }
      popupComponent = (
        <Popup
          coordinates={featureCoordinates}
          anchor="bottom"
        >
          <div>
            {selectedCamera.name}
            {mobile && (
              <div className="MobileDetails__container">
                <img
                  alt=""
                  style={{ width: '200px' }}
                  src={selectedCamera.latestPhotoUrl}
                />
              </div>
            )}
          </div>
        </Popup>
      );
    } else if (selectedFeature.type === "Misc") {
      const selectedMiscLocation = selectedFeature.data;
      layerId = 'selectedMiscLocation';
      iconImage = 'selected-location-marker'
      featureCoordinates = selectedMiscLocation.coordinates;
      featureProperties = {};
      popupComponent = (
        <Popup
          coordinates={featureCoordinates}
          anchor="bottom"
        >
          <div>
            {selectedMiscLocation.name}
          </div>
        </Popup>
      );
    }
  } else {
    return null
  }

  return (
    <div>
      <Layer
        type="symbol"
        id={layerId}
        layout={{
          'icon-image': `${iconImage}`,
          'icon-allow-overlap': true,
        }}
      >
        <Feature
          key={1}
          coordinates={featureCoordinates}
          properties={featureProperties}
        />
      </Layer>
      {popupComponent}
    </div>
  )
}
