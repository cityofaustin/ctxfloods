import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';

import TopBar from 'components/Shared/TopBar';
import Header from 'components/Shared/Header';
import CommunityListDropdownButton from 'components/Shared/CommunityListDropdown/CommunityListDropdownButton';

export default function PublicHeader({ location }) {
  return (
    <div>
      <TopBar>
        <div>
          <a href="/">Translate</a>
        </div>
      </TopBar>
      <Header>
        <li
          className={
            location.pathname.includes('/map')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/map">Crossings Map</Link>
        </li>
        <CommunityListDropdownButton />
        <li
          className={
            location.pathname.endsWith('safety')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/safety">Flood Safety</Link>
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
      </Header>
    </div>
  );
}

PublicHeader.propTypes = {
  location: PropTypes.object.isRequired,
  currentUser: PropTypes.object.isRequired,
};
