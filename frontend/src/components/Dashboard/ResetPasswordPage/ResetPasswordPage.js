import React, { Component } from 'react';
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import { Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';

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
    };

    const { resetterJwt } = props.match.params;

    if (resetterJwt) {
      localStorage.setItem('jwt_user_token', resetterJwt)
    }
  }

  handlePasswordChange = (e) => {
    this.setState({ password: e.target.value });
  }

  handleConfirmPasswordChange = (e) => {
    this.setState({ confirmPassword: e.target.value });
  }

  handleSubmit = (e) => {
    e.preventDefault();
    const password = this.state.password.trim();

    this.props
      .mutate({
        variables: { newPassword: password },
      })
      .then(({ data }) => {
        localStorage.setItem('jwt_user_token', data.resetPassword.jwtToken);
        this.setState({passwordResetSuccessfully: true});
        this.props.onLogin();
      })
      .catch(error => {
        console.log('there was an error sending the query', error);
      });
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
          passwordResetSuccessfully && <Redirect to="/dashboard" />
        }
      </div>
    );
  }
}

const resetPassword = gql`
  mutation($newPassword: String!) {
    resetPassword(input:{newPassword:$newPassword}) {
      jwtToken
    }
  }
`;

export default graphql(resetPassword)(ResetPasswordPage);
