import React, { Component } from 'react';

import 'components/Dashboard/CrossingListPage/DashboardCrossingListItem/DurationSelection.css';
import DatePicker from 'components/Shared/DatePicker';
/**
  Passes an estimated reopenDate via the "onChange" prop.
  Unless the "Closed Indefinitely" checkbox is ticked, then the crossing will not have an estimated reopenDate.
**/
export default class DurationSelection extends Component {
  render() {
    const { reopenDate, indefiniteClosure } = this.props;

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
                <DatePicker
                  date={reopenDate}
                  checkForExpiration={true}
                  onChange={newReopenDate => {
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
