import React, { Component } from 'react';
import { Route, Redirect, Switch } from 'react-router-dom';
import PrivateRoute from 'PrivateRoute';
import Header from 'components/Dashboard/Header/Header';
import ManageUsers from 'components/Dashboard/ManageUsersPage/ManageUsers';
import LoginPage from 'components/Dashboard/LoginPage/LoginPage';

import CrossingMapPage from 'components/Shared/CrossingMapPage/CrossingMapPage';
import CrossingListPage from 'components/Dashboard/CrossingListPage/CrossingListPage';
import CrossingDetailPage from 'components/Dashboard/CrossingDetailPage/CrossingDetailPage';
import AddCrossingPage from 'components/Dashboard/AddCrossingPage/AddCrossingPage';
import CrossingStatusHistoryPage from 'components/Dashboard/CrossingStatusHistoryPage/CrossingStatusHistoryPage';
import OpenDataPage from 'components/Shared/OpenDataPage/OpenDataPage';
import PublicHeader from 'components/Public/Header/PublicHeader';
import ForgotPasswordPage from 'components/Dashboard/ForgotPasswordPage/ForgotPasswordPage';
import ResetPasswordPage from 'components/Dashboard/ResetPasswordPage/ResetPasswordPage';

import auth from 'services/gqlAuth';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

var blarg = 3;

class FloodsRoutes extends Component {
  onLogin = () => {
    this.props.data.refetch({
      skip: !auth.isAuthenticated(),
    });
  };

  render() {
    const currentUser = this.props.data && this.props.data.currentUser;

    if (this.props.data && this.props.data.loading) {
      return <div>Loading</div>;
    }

    return (
      <div className="PageLayout">
        <Route path="/" exact render={() => <Redirect to="/map" />} />
        <Route
          path="/dashboard"
          exact
          render={() => <Redirect to="/dashboard/crossings/map" />}
        />

        <Switch>
          <Route exact path="/dashboard/forgot_password" component={ForgotPasswordPage} />
          <Route path="/dashboard/reset_password/:resetterJwt" render={props => <ResetPasswordPage onLogin={this.onLogin} {...props}/>} />
          <Route
            path="/dashboard"
            render={props =>
              currentUser ? (
                <Header currentUser={currentUser} {...props} />
              ) : (
                <LoginPage onLogin={this.onLogin} />
              )
            }
          />
          <Route component={PublicHeader} />
        </Switch>

        <Route path="/map" component={CrossingMapPage} />
        <Route exact path="/data" component={OpenDataPage} />

        <PrivateRoute
          path="/dashboard/users"
          component={ManageUsers}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
        <PrivateRoute
          path="/dashboard/crossings/map"
          component={CrossingMapPage}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_editor',
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
        <PrivateRoute
          path="/dashboard/crossings/list"
          component={CrossingListPage}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_editor',
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
        <PrivateRoute
          path="/dashboard/crossing/:id"
          component={CrossingDetailPage}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_editor',
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
        <PrivateRoute
          path="/dashboard/crossings/add"
          component={AddCrossingPage}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
        <PrivateRoute
          path="/dashboard/crossings/history"
          component={CrossingStatusHistoryPage}
          authenticated={auth.isAuthenticated()}
          authorized={auth.roleAuthorized([
            'floods_community_admin',
            'floods_super_admin',
          ])}
          currentUser={currentUser}
        />
      </div>
    );
  }
}

// https://github.com/apollographql/react-apollo/issues/289#issuecomment-340718130
// Use the `@skip` directive instead of apollo's `skip`.
// This allows us to call refetch() in the component, so we can rerender after logging in.
const currentUser = gql`
  query currentUserQuery($skip: Boolean!) {
    currentUser @skip(if: $skip) {
      id
      communityId
      communityByCommunityId {
        id
        viewportgeojson
        name
      }
      role
      firstName
      lastName
    }
  }
`;

export default graphql(currentUser, {
  options: {
    variables: {
      skip: !auth.isAuthenticated(),
    },
  },
})(FloodsRoutes);
