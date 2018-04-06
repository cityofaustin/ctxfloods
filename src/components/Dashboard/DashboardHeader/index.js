import React from 'react';
import { Link } from 'react-router-dom';

import Header from 'components/Shared/Header';
import TopBar from 'components/Shared/TopBar';
import UserControls from 'components/Shared/Header/UserControls';

export default function DashboardHeader({ location, ...props }) {
  return (
    <div>
      <TopBar>
        <UserControls {...props} />
      </TopBar>
      <Header location={location}>
        <li
          className={
            location.pathname.endsWith('crossings/list')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/dashboard/crossings/list">Crossings List</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('crossings/map')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/dashboard/crossings/map">Crossings Map</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('crossings/add')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/dashboard/crossings/add">Add Crossing</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('crossings/history')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/dashboard/crossings/history">History</Link>
        </li>
        <li
          className={
            location.pathname.endsWith('users')
              ? 'Header__tab--active'
              : 'Header__tab'
          }
        >
          <Link to="/dashboard/users">Manage Users</Link>
        </li>
      </Header>
    </div>
  );
}
