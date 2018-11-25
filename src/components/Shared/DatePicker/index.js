import Flatpickr from 'react-flatpickr';
import moment from 'moment';
import React, { Component } from 'react';

import 'flatpickr/dist/themes/material_blue.css';
import 'components/Shared/DatePicker/DatePicker.css';
import Emoji from '../Emoji';

/**
  Passes an estimated reopenDate via the "onChange" prop.
  Unless the "Closed Indefinitely" checkbox is ticked, then the crossing will not have an estimated reopenDate.
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
    const flatpickrDate = this.stringToDate(reopenDate);
    const isExpired = moment(this.props.reopenDate).isBefore(moment(moment.now()).format('YYYY-MM-DD'));

    return (
      <div className="duration-container">
        <table className='duration-table'>
          <tbody>
            <tr>
              <td>
                Estimated Reopen Date:
              </td>
              <td className='table-spacing'>
              </td>
              <td>
                <Flatpickr
                  options={{
                    dateFormat: 'Y-m-d',
                    minDate: 'today',
                    enableTime: false,
                    wrap: true,
                    allowInput: true
                  }}
                  value={flatpickrDate}
                  onChange={date => {
                    const newReopenDate = this.dateToString(date[0])
                    this.props.onChange({
                      indefiniteClosure: false,
                      reopenDate: newReopenDate
                    });
                  }}
                >
                  <span className={`expired-reopen-date ${!isExpired && 'eliminated'}`} data-toggle>
                    {reopenDate}
                  </span>
                  <input className={`flatpickr-input-box ${isExpired && 'hidden-input-box'}`} type="text" data-input />
                  <span className="flatpickr-input-button" title="toggle" data-toggle>
                    <Emoji symbol="📅" label="calendar"/>
                  </span>
                </Flatpickr>
              </td>
            </tr>
            <tr>
              <td>
                Closed Indefinitely:
              </td>
              <td className='table-spacing'>
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
