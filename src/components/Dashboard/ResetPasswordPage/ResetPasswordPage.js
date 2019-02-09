import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import { Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';
import queryString from 'query-string';

import { isTokenReal, isTokenValid } from 'services/jwtHelper';
import { logError } from 'services/logger';
import 'scss/auth.css';

class ResetPasswordPage extends Component {
  static propTypes = {
    onLogin: PropTypes.func.isRequired,
  };

  constructor(props) {
    super(props);

    this.state = {
      waiting: false,
      password: '',
      confirmPassword: '',
      passwordResetSuccessfully: false,
      newLinkSetSuccessfully: false,
      errorHappened: false,
      errorMessage: "",
    };

    const { resetterJwt, email } = queryString.parse(props.location.search);
    this.email = email;

    if (isTokenReal(resetterJwt)) {
      if (isTokenValid(resetterJwt)) {
        this.tokenExpired = false;
        localStorage.setItem('jwt_user_token', resetterJwt);
      } else {
        this.tokenExpired = true;
      }
    } else {
      this.tokenInvalid = true;
    }
  }

  handlePasswordChange = e => {
    this.setState({ password: e.target.value });
  };

  handleConfirmPasswordChange = e => {
    this.setState({ confirmPassword: e.target.value });
  };

  handleSendNewLink = e => {
    this.setState({ waiting: true });
    e.preventDefault();
    fetch(`${process.env.REACT_APP_BACKEND_URL}/email/reset`, {
      method: 'POST',
      body: JSON.stringify({ email: this.email, newUser: false }),
      headers: new Headers({
        'Content-Type': 'application/json',
      }),
    })
    .then(res => {
      if (res.status === 204) {
        this.setState({
          newLinkSetSuccessfully: true,
          errorHappened: false,
          waiting: false,
        });
      } else if (res.status === 400 || res.status === 500) {
        this.setState({
          newLinkSetSuccessfully: false,
          errorHappened: true,
          errorMessage: "Server Error. Failed to reset password.",
          waiting: false,
        });
      }
    })
    .catch(err => {
      logError(err);
      this.setState({
        newLinkSetSuccessfully: false,
        errorHappened: true,
        errorMessage: "Server Error. Failed to reset password.",
        waiting: false,
      });
    })
  }

  handleForgotPasswordLink = e => {
    e.preventDefault();
    this.props.history.push('/dashboard/forgot_password');
  }

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
    let content;
    const {
      waiting,
      passwordResetSuccessfully,
      newLinkSetSuccessfully,
      password,
      confirmPassword,
      errorHappened,
      errorMessage
    } = this.state;

    // Content if JWT Token is invalid
    if (this.tokenInvalid) {
      content = (
        <div className="Auth__error-text Auth__form-controls">
          Error: Invalid "Reset Password" link. Please <button className='button-link' onClick={this.handleForgotPasswordLink}>Click Here</button> if you need to reset your password.
        </div>
      )
    // Content if JWT Token is Expired
    } else if (this.tokenExpired) {
      if (!waiting && !newLinkSetSuccessfully) {
        content = (
          <div className="Auth__form-controls">
            <p>For security reasons, this "Reset Password" link has expired.</p>
            <p>Please click the button below, and we will send you an email containing a fresh link.</p>
            <p>You will have 30 minutes to reset your password with that new link.</p>
            {errorHappened && (
              <div className="Auth__error-text">
                {' '}
                {errorMessage}{' '}
              </div>
            )}
            <form onSubmit={this.handleSendNewLink}>
              <input
                type="submit"
                disabled={newLinkSetSuccessfully}
                className="Auth__submit"
                value="Email me a New Link"
              />
            </form>
          </div>
        )
      } else if (waiting) {
        content = (
          <FontAwesome
            name="spinner"
            size="4x"
            className="Auth__waiting fa-spin"
          />
        )
      } else if (newLinkSetSuccessfully) {
        content = (
          <div className="Auth__form-controls">
            <h1> Email Sent! </h1>
            <p>You have 30 minutes to reset your password before your email's link expires.</p>
          </div>
        )
      }
    // Content for Valid JWT Token
    } else {
      content = (
        <div>
          {!passwordResetSuccessfully && (
            <div className="Auth__form-controls">
              <h1> Reset your password </h1>
              {errorHappened && (
                <div className="Auth__error-text">
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
                  className="Auth__submit"
                  value="Reset Password"
                />
              </form>
            </div>
          )}
          {passwordResetSuccessfully && <Redirect to="/dashboard" />}
        </div>
      );
    }

    return (
      <div className="AuthPage">
        {content}
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
