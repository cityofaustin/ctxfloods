import 'flatpickr/dist/themes/material_blue.css';
import Flatpickr from 'react-flatpickr';
import moment from 'moment';
import React, { Component } from 'react';

/**
  Passes an estimated openDate via the "onChange" prop.
  Unless the "Indefinite Closure" checkbox is ticked, then the crossing will not have an estimated openDate.
**/
export default class DatePicker extends Component {
  stringToDate(dateString) {
    return dateString ? moment(dateString).toDate() : null;
  }

  dateToString(date) {
    return moment(date).format('YYYY-MM-DD');
  }

  render() {
    const { openDate, indefiniteClosure } = this.props;
    const flatpickrDate = this.stringToDate(openDate)

    return (
      <div>
        {true &&
          <div>
            Estimated Open Date:
            <Flatpickr
              options={{
                dateFormat: 'Y-m-d',
                minDate: 'today',
                enableTime: false
              }}
              value={flatpickrDate}
              onChange={date => {
                const newOpenDate = this.dateToString(date[0])
                this.props.onChange({
                  indefiniteClosure: false,
                  openDate: newOpenDate
                });
              }}
            />
          </div>
        }
        <div>
          Indefinite Closure:
          <input
            type="checkbox"
            checked={indefiniteClosure}
            onChange={() => {
              console.log("checkbox was ", indefiniteClosure)
              if (indefiniteClosure) {
                this.props.onChange({
                  indefiniteClosure: false,
                  openDate: null,
                });
              } else {
                this.props.onChange({
                  indefiniteClosure: true,
                  openDate: null
                });
              }
            }}
          />
        </div>
      </div>
    )
  }
}
