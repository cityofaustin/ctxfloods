import React, { Component } from 'react';

import 'components/Dashboard/ResetPasswordPage/ResetPasswordPage.css';

class ResetPasswordPage extends Component {
  state = {
    password: '',
    confirmPassword: '',
    passwordResetSuccessfully: false,
  };

  handlePasswordChange = (e) => {
    this.setState({ password: e.target.value });
  }

  handleConfirmPasswordChange = (e) => {
    this.setState({ confirmPassword: e.target.value });
  }

  handleSubmit = (e) => {
    this.setState({passwordResetSuccessfully: true});
  }

  render() {
    const { passwordResetSuccessfully, password, confirm } = this.state;

    return (
      <div className="ResetPasswordPage">
        { !passwordResetSuccessfully &&
        <div className="ResetPasswordPage__form-controls">
          <h1> Reset your password </h1>
          <form
            onSubmit={this.handleSubmit}
          >
            <input
              type="password"
              value={this.state.password}
              placeholder="Password"
              onChange={this.handlePasswordChange}
            />
            <input
              type="password"
              value={this.state.confirmPassword}
              placeholder="Confirm"
              onChange={this.handleConfirmPasswordChange}
            />
            <input type="submit" className="ResetPasswordPage__submit" value="Reset Password" />
          </form>
        </div>
        }
        {
          passwordResetSuccessfully && <h1> Password Reset. </h1>
        }
      </div>
    );
  }
}

export default ResetPasswordPage;
