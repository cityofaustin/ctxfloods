import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';

import Header from 'components/Shared/Header';
import CommunityListDropdownButton from 'components/Shared/CommunityListDropdown/CommunityListDropdownButton';

export default function PublicHeader({ location }) {
  return (
    <div>
      <Header location={location}>
        <li
          className={
            location.pathname.includes('/map')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/map">Crossings Map</Link>
        </li>
        <CommunityListDropdownButton onDash={location.pathname.includes('dashboard')}/>
        <li
          className={
            location.pathname.endsWith('safety')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/flood-safety">Flood Safety</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('data')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/data">Open Data</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('about')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/about">About</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('report-incident')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/report-incident">Report Incident</Link>
        </li>
      </Header>
    </div>
  );
}

PublicHeader.propTypes = {
  location: PropTypes.object.isRequired,
};
