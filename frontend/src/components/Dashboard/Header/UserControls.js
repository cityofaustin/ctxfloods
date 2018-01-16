import React from 'react';
import { Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import auth from 'services/gqlAuth'

import cogSvg from 'images/cog.svg';
import 'components/Dashboard/Header/UserControls.css'

class UserControlsBase extends React.Component {
  render() {
    return (
      auth.isAuthenticated() ? (
        <div className="UserControls">
          <img src={cogSvg} alt="Link User Settings" className="Header__settings-icon" />
          { this.props.cqParams.fullsize && this.props.currentUser ? (
            <Link className="UserControls__text" to="#">
              {`${this.props.currentUser.firstName} ${this.props.currentUser.lastName}`}
            </Link> ) : ''
          }
          { this.props.cqParams.fullsize ? (

            <div
              className="underline UserControls__text"
              onClick={() => auth.signout(() => window.location.reload())}
            >
              Sign out
            </div>
            ) : null
          }
          
        </div>
      ) : null
    )
  }
}

const UserControls = withRouter(UserControlsBase)

export default UserControls;
