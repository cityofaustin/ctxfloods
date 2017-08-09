import React from 'react'
import { Link } from 'react-router-dom';
import AuthButton from './AuthButton';

class Header extends React.Component {

  getTitleByPathname(pathname) {
    if (pathname.startsWith("/dashboard")) {
      return "CTXFloods Dashboard";
    } else {
      return "CTXFloods";
    }
  }

  render() {
    const { pathname } = this.props.location;
    return (
      <div className="header">
        <h1>{this.getTitleByPathname(pathname)}</h1>

        <ul>
          <li><Link to="/public">Public Page</Link></li>
          <li><Link to="/crossings">List Crossings (Public)</Link></li>
          <li><Link to="/dashboard/users">Manage Users</Link></li>
          <li><Link to="/protected">Protected Page</Link></li>
          <li><Link to="/createuser">Create User (Protected)</Link></li>
          <li><Link to="/updatestatus">Update Crossing Status (Protected)</Link></li>
        </ul>
        <AuthButton/>

      </div>
    );
  }

}

export default Header;
