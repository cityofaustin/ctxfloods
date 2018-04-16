import React from 'react';

import ContentPage from 'components/Shared/ContentPage';

export default function AboutPage() {
  return (
    <ContentPage>
      <h1>About CTXfloods</h1>
      <p>
        CTXfloods is maintained by the City of Austin Flood Early Warning System
        (FEWS) team. FEWS monitors weather and road conditions 24-7 on an
        on-call basis.
      </p>
      <p>
        We keep the map and closure information as up-to-date as possible based
        on the best information currently available, but drivers should pay
        attention to road conditions. If you see water on the road, save
        yourself! Turn around, don't drown!
      </p>
    </ContentPage>
  );
}
