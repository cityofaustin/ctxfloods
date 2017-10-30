import React from 'react';
import FontAwesome from 'react-fontawesome';
import moment from 'moment';
import './DateTime.css';

class DateTime extends React.Component {
  render () {
    const { datetime, user } = this.props;

    return (
      <div className="DateTime">
        <div className="DateTime__clock-icon">
          <FontAwesome name="clock-o" />
        </div>
        <div className="DateTime__text">
          <div>{ moment(datetime).format("MM/DD/YY, h:mm a") }</div>
          <div style={{textDecoration:"underline"}}>
            { user.firstName.substring(0, 1) + '. ' + user.lastName }
          </div>
        </div>
      </div>
    );
  }
}

export default DateTime;
