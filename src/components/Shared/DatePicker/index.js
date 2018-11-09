import Flatpickr from 'react-flatpickr';
import moment from 'moment';
import React, { Component } from 'react';

import 'flatpickr/dist/themes/material_blue.css';
import 'components/Shared/DatePicker/DatePicker.css';
/**
  Passes an estimated reopenDate via the "onChange" prop.
  Unless the "Indefinite Closure" checkbox is ticked, then the crossing will not have an estimated reopenDate.
**/
export default class DatePicker extends Component {
  stringToDate(dateString) {
    return dateString ? moment(dateString).toDate() : null;
  }

  dateToString(date) {
    return moment(date).format('YYYY-MM-DD');
  }

  render() {
    const { reopenDate, indefiniteClosure } = this.props;
    const flatpickrDate = this.stringToDate(reopenDate)

    return (
      <div className="duration-container">
        <table className='duration-table'>
          <tbody>
            <tr>
              <td>
                Estimated Reopen Date:
              </td>
              <td>
                <Flatpickr
                  className='flatpickr-extra'
                  options={{
                    dateFormat: 'Y-m-d',
                    minDate: 'today',
                    enableTime: false
                  }}
                  value={flatpickrDate}
                  onChange={date => {
                    const newReopenDate = this.dateToString(date[0])
                    this.props.onChange({
                      indefiniteClosure: false,
                      reopenDate: newReopenDate
                    });
                  }}
                />
              </td>
            </tr>
            <tr>
              <td>
                Indefinite Closure:
              </td>
              <td>
                <input
                  type="checkbox"
                  checked={indefiniteClosure}
                  onChange={() => {
                    if (indefiniteClosure) {
                      this.props.onChange({
                        indefiniteClosure: false,
                        reopenDate: null,
                      });
                    } else {
                      this.props.onChange({
                        indefiniteClosure: true,
                        reopenDate: null
                      });
                    }
                  }}
                />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    )
  }
}
