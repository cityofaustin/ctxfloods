import moment from 'moment-timezone';
const timezone = moment.tz.guess();

export default function Hour({ date }) {
  return moment(date).tz(timezone).format('h:mm A');
}
