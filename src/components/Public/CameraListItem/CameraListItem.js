import React from 'react';
import cameraIcon from 'images/camera-small.svg';

import Date from 'components/Shared/DateTime/Date';
import Hour from 'components/Shared/DateTime/Hour';

export default function CameraListItem(props) {
  console.log('Some camera stuff', props)
  const {camera} = props;
  return (
    <div className="PublicCrossingListItem">
      <div className="PublicCrossingListItem__overview">
        <div className="PublicCrossingListItem__status-icon">
          <img src={cameraIcon} alt={"camera"}/>
        </div>
        <div className="PublicCrossingListItem__info">
          <div className="PublicCrossingListItem__status-name">
            Camera
          </div>
          <div className="PublicCrossingListItem__crossing-name">
            {camera.name}
          </div>
        </div>
        <div className="PublicCrossingListItem__datetime">
          <div className="PublicCrossingListItem__datetime-date">
            <Date date={camera.uploadedAt} />
          </div>
          <div>
            <Hour date={camera.uploadedAt} />
          </div>
        </div>
      </div>
      <div style={{ textAlign: 'center', paddingBottom: '2rem' }}>
        <img
          alt={camera.name}
          style={{ width: '400px' }}
          src={camera.latestPhotoUrl}
        />
      </div>
    </div>
  )
}
