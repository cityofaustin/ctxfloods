import 'flatpickr/dist/themes/material_blue.css';
import Flatpickr from 'react-flatpickr';
import moment from 'moment';
import React, { Component } from 'react';
import { INDEFINITE } from '../../../constants/StatusConstants';

/**
  Passes an estimated openDate via the "onChange" prop.
  If "Indefinite Closure" checkbox is ticked, then the openDate will be set to '3000-01-01.'
  ''
**/
export default class DatePicker extends Component {
  constructor(props) {
    super(props);
    this.state = {
      indefinite: false,
      flatpickrDate: this.stringToDate(this.props.date)
    }
    if (this.dateToString(this.props.date) === INDEFINITE) {
      this.state.indefinite = true;
    }
  }

  stringToDate(dateString) {
    return (dateString && dateString !== INDEFINITE) ?
      moment(dateString).toDate() : null;
  }

  dateToString(date) {
    return moment(date).format('YYYY-MM-DD');
  }

  render() {
    const { flatpickrDate } = this.state;

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
                const stringifiedDate = this.dateToString(date[0])
                this.setState({indefinite: false});
                this.setState({flatpickrDate: stringifiedDate});
                this.props.onChange(stringifiedDate);
              }}
            />
          </div>
        }
        <div>
          Indefinite Closure:
          <input
            type="checkbox"
            checked={this.state.indefinite}
            onChange={() => {
              if (this.state.indefinite) {
                this.setState({indefinite: false});
                this.setState({flatpickrDate: null});
                this.props.onChange(null);
              } else {
                this.setState({indefinite: true});
                this.setState({flatpickrDate: null});
                this.props.onChange(INDEFINITE);
              }
            }}
          />
        </div>
      </div>
    )
  }
}
