import React, { Component } from 'react';

import 'components/Dashboard/ForgotPasswordPage/ForgotPasswordPage.css';

class ForgotPasswordPage extends Component {
  state = {
    email: '',
    emailSentSuccessfully: false,
  };

  handleEmailChange = (e) => {
    this.setState({ email: e.target.value });
  }

  handleSubmit = (e) => {
    this.setState({emailSentSuccessfully: true});
  }

  render() {
    const { emailSentSuccessfully } = this.state;

    return (
      <div className="ForgotPasswordPage">
        { !emailSentSuccessfully &&
        <div className="ForgotPasswordPage__form-controls">
          <h1> Reset your password </h1>
          <form
            onSubmit={this.handleSubmit}
          >
            <input
              type="text"
              value={this.state.email}
              placeholder="Email"
              onChange={this.handleEmailChange}
            />
            <input type="submit" className="ForgotPasswordPage__submit" value="Send Reset Email" />
          </form>
        </div>
        }
        {
          emailSentSuccessfully && <h1> Email Sent! </h1>
        }
      </div>
    );
  }
}

export default ForgotPasswordPage;
