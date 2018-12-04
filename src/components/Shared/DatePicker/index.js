import React, { Component } from 'react';
import Flatpickr from 'react-flatpickr';
import moment from 'moment';

import 'flatpickr/dist/themes/material_blue.css';
import 'components/Shared/DatePicker/DatePicker.css';
import Emoji from 'components/Shared/Emoji';
import {dateToString} from 'components/../services/dateHelpers';

export default class DatePicker extends Component {

  handleDateChange = (date) => {
    if (date[0]) {
      this.props.onChange(dateToString(date[0]))
    } else {
      this.props.onChange(this.props.date)
    }
  }

  render() {
    const {date, checkForExpiration, maxDate, minDate} = this.props;
    const options = {
      dateFormat: 'Y-m-d',
      enableTime: false,
      wrap: true,
      allowInput: true,
    }

    let isExpired = false;
    if (checkForExpiration) {
      isExpired = moment(this.props.reopenDate).isBefore(moment(moment.now()).format('YYYY-MM-DD'));
      options.minDate = 'today';
    } else {
      options.maxDate = maxDate || null;
      options.minDate = minDate || null;
    }

    return (
      <Flatpickr
        className="flatpickr"
        options={options}
        value={date}
        onChange={date => this.handleDateChange(date)}
        onClose={date => this.handleDateChange(date)}
      >
        <span className={`expired-reopen-date ${!isExpired && 'eliminated'}`} data-toggle>
          {date}
        </span>
        <input className={`flatpickr-input-box ${isExpired && 'hidden-input-box'}`} type="text" data-input />
        <span className="flatpickr-input-button" title="toggle" data-toggle>
          <Emoji symbol="📅" label="calendar"/>
        </span>
      </Flatpickr>
    )
  }
}
