import React, { Component } from 'react';
import FontAwesome from 'react-fontawesome';

import 'components/Dashboard/ForgotPasswordPage/ForgotPasswordPage.css';

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
      body: JSON.stringify({ email: this.state.email }),
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
      .catch(error => {
        console.error(error);
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
      <div className="ForgotPasswordPage">
        {!emailSentSuccessfully &&
          !waiting && (
            <div className="ForgotPasswordPage__form-controls">
              <h1> Reset your password </h1>
              {errorHappened && (
                <div className="ForgotPasswordPage__error-text">
                  {' '}
                  Failed to send password reset email{' '}
                </div>
              )}
              <form onSubmit={this.handleSubmit}>
                <input
                  type="text"
                  value={this.state.email}
                  placeholder="Email"
                  onChange={this.handleEmailChange}
                />
                <input
                  type="submit"
                  className="ForgotPasswordPage__submit"
                  value="Send Reset Email"
                />
              </form>
            </div>
          )}
        {waiting && (
          <FontAwesome
            name="spinner"
            size="4x"
            className="ForgotPasswordPage__waiting fa-spin"
          />
        )}
        {emailSentSuccessfully && <h1> Email Sent! </h1>}
      </div>
    );
  }
}

export default ForgotPasswordPage;
