import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';

import { logError } from 'services/logger';

import 'scss/auth.css';

class ForgotPasswordPage extends Component {
  state = {
    email: '',
    waiting: false,
    emailSentSuccessfully: false,
    errorHappened: false,
  };

  handleEmailChange = e => {
    this.setState({ email: e.target.value });
  };

  handleSubmit = e => {
    this.setState({ waiting: true });
    e.preventDefault();
    fetch(`${process.env.REACT_APP_BACKEND_URL}/email/reset`, {
      method: 'POST',
      body: JSON.stringify({ email: this.state.email, newUser: false }),
      headers: new Headers({
        'Content-Type': 'application/json',
      }),
    })
      .then(res => {
        if (res.status === 204) {
          this.setState({
            emailSentSuccessfully: true,
            errorHappened: false,
          });
        } else if (res.status === 400) {
          this.setState({
            emailSentSuccessfully: false,
            errorHappened: true,
          });
        }
      })
      .catch(err => {
        logError(err);
        this.setState({
          emailSentSuccessfully: false,
          errorHappened: true,
        });
      })
      .then(() => {
        this.setState({ waiting: false });
      });
  };

  render() {
    const { emailSentSuccessfully, waiting, errorHappened } = this.state;
    return (
      <div className="AuthPage">
        {!emailSentSuccessfully &&
          !waiting && (
            <div className="Auth__form-controls">
              <h1> Reset your password </h1>
              {errorHappened && (
                <div className="Auth__error-text">
                  {' '}
                  Failed to send password reset email{' '}
                </div>
              )}
              <form onSubmit={this.handleSubmit}>
                <input
                  type="email"
                  value={this.state.email}
                  placeholder="Email"
                  onChange={this.handleEmailChange}
                />
                <input
                  type="submit"
                  className="Auth__submit"
                  value="Send Reset Email"
                />
              </form>
            </div>
          )}
        {waiting && (
          <FontAwesome
            name="spinner"
            size="4x"
            className="Auth__waiting fa-spin"
          />
        )}
        {emailSentSuccessfully && (
          <div className="Auth__form-controls">
            <h1> Email Sent! </h1>
            <p>You have 30 minutes to reset your password before your email's link expires.</p>
          </div>
        )}
      </div>
    );
  }
}

export default ForgotPasswordPage;
