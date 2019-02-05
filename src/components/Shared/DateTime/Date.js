import moment from 'moment-timezone';
const timezone = moment.tz.guess();

export default function Date({ date }) {
  return moment(date).tz(timezone).calendar(null, {
    lastDay: '[Yesterday]',
    sameDay: '[Today]',
    sameElse: 'MM/DD/YYYY',
  });
}
