import React, { Component } from 'react';
import { Link } from 'react-router-dom';

import Header from 'shared/components/Header';
import TopBar from 'components/Shared/TopBar';
import UserControls from 'components/Shared/Header/UserControls';


export default class DashboardHeader extends Component {
  render() {
    const { pathname } = this.props.location;
    return (
      <div>
        <TopBar>
          <UserControls {...this.props} />
        </TopBar>
        <Header>
          <ul className="Header__tabs">
            <li
              className={
                pathname.endsWith('crossings/list')
                  ? 'Header__tab--active'
                  : 'Header__tab'
              }
            >
              <Link to="/dashboard/crossings/list">Crossings List</Link>
            </li>
            <li
              className={
                pathname.endsWith('crossings/map')
                  ? 'Header__tab--active'
                  : 'Header__tab'
              }
            >
              <Link to="/dashboard/crossings/map">Crossings Map</Link>
            </li>
            <li
              className={
                pathname.endsWith('crossings/add')
                  ? 'Header__tab--active'
                  : 'Header__tab'
              }
            >
              <Link to="/dashboard/crossings/add">Add Crossing</Link>
            </li>
            <li
              className={
                pathname.endsWith('crossings/history')
                  ? 'Header__tab--active'
                  : 'Header__tab'
              }
            >
              <Link to="/dashboard/crossings/history">History</Link>
            </li>
            <li
              className={
                pathname.endsWith('users')
                  ? 'Header__tab--active'
                  : 'Header__tab'
              }
            >
              <Link to="/dashboard/users">Manage Users</Link>
            </li>
          </ul>
        </Header>
      </div>
    );
  }
}
