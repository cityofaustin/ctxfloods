import React from 'react';
import { Link } from 'react-router-dom';

import TopBar from 'components/Shared/TopBar';

import 'components/Public/Header/PublicHeader.css';

class PublicHeader extends React.Component {
  componentDidMount() {
    const { pathname } = this.props.location;
    document.title = `CTXFloods - ${pathname}`;
  }

  render() {
    const { pathname } = this.props.location;
    return (
      <div>
        <TopBar>
          <div>
            <a href="/">Translate</a>
          </div>
        </TopBar>
        <div className="Header">
          <div className="Header__main">
            <h1 className="Header__h1">{'CTXfloods'}</h1>
            <ul className="Header__tabs">
              <li
                className={
                  pathname.endsWith('map')
                    ? 'Header__tab--active'
                    : 'Header__tab'
                }
              >
                <Link to="/map">Crossings Map</Link>
              </li>
              <li
                className={
                  pathname.endsWith('safety')
                    ? 'Header__tab--active'
                    : 'Header__tab'
                }
              >
                <Link to="/safety">Flood Safety</Link>
              </li>
              <li
                className={
                  pathname.endsWith('data')
                    ? 'Header__tab--active'
                    : 'Header__tab'
                }
              >
                <Link to="/data">Open Data</Link>
              </li>
              <li
                className={
                  pathname.endsWith('about')
                    ? 'Header__tab--active'
                    : 'Header__tab'
                }
              >
                <Link to="/about">About</Link>
              </li>
            </ul>
          </div>
        </div>
      </div>
    );
  }
}

export default PublicHeader;
