import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import { Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';

import { logError } from 'services/logger';
import 'components/Dashboard/ResetPasswordPage/ResetPasswordPage.css';

class ResetPasswordPage extends Component {
  static propTypes = {
    onLogin: PropTypes.func.isRequired,
  };

  constructor(props) {
    super(props);

    this.state = {
      password: '',
      confirmPassword: '',
      passwordResetSuccessfully: false,
      errorHappened: false,
      errorMessage: ""
    };

    const { resetterJwt } = props.match.params;

    if (resetterJwt) {
      localStorage.setItem('jwt_user_token', resetterJwt);
    }
  }

  handlePasswordChange = e => {
    this.setState({ password: e.target.value });
  };

  handleConfirmPasswordChange = e => {
    this.setState({ confirmPassword: e.target.value });
  };

  handleSubmit = e => {
    e.preventDefault();
    const password = this.state.password.trim();
    const confirmPassword = this.state.confirmPassword.trim();
    if (!password.length || (password !== confirmPassword)) {
      this.setState({
        errorHappened: true,
        errorMessage: "Passwords did not match"
      })
    } else {
      this.props
      .mutate({
        variables: { newPassword: password },
      })
      .then(({ data }) => {
        localStorage.setItem('jwt_user_token', data.resetPassword.jwtToken);
        this.setState({
          passwordResetSuccessfully: true,
          errorHappened: false,
        });
        this.props.onLogin();
      })
      .catch(error => {
        logError('there was an error sending the query', error);
        this.setState({
          passwordResetSuccessfully: false,
          errorHappened: true,
          errorMessage: "Server Error. Failed to reset password."
        });
      });
    }
  };

  render() {
    const {
      passwordResetSuccessfully,
      password,
      confirmPassword,
      errorHappened,
      errorMessage
    } = this.state;

    return (
      <div className="ResetPasswordPage">
        {!passwordResetSuccessfully && (
          <div className="ResetPasswordPage__form-controls">
            <h1> Reset your password </h1>
            {errorHappened && (
              <div className="ResetPasswordPage__error-text">
                {' '}
                {errorMessage}{' '}
              </div>
            )}
            <form onSubmit={this.handleSubmit}>
              <input
                type="password"
                value={password}
                placeholder="Password"
                onChange={this.handlePasswordChange}
              />
              <input
                type="password"
                value={confirmPassword}
                placeholder="Confirm"
                onChange={this.handleConfirmPasswordChange}
              />
              <input
                type="submit"
                className="ResetPasswordPage__submit"
                value="Reset Password"
              />
            </form>
          </div>
        )}
        {passwordResetSuccessfully && <Redirect to="/dashboard" />}
      </div>
    );
  }
}

const resetPassword = gql`
  mutation($newPassword: String!) {
    resetPassword(input: { newPassword: $newPassword }) {
      jwtToken
    }
  }
`;

export default graphql(resetPassword)(ResetPasswordPage);
