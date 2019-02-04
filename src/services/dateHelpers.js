import moment from 'moment-timezone';
const timezone = moment.tz.guess();

// 'YYYY-MM-DD' to Date
export function stringToDate(dateString) {
  return dateString ? moment(dateString).toDate() : null;
}

// Date to 'YYYY-MM-DD'
export function dateToString(date) {
  return moment(date).format('YYYY-MM-DD');
}

// 'YYYY-MM-DD' to Timestamp With Timezone (for database queries)
// Return null if date is falsy
export function dateToTimestampWithTimezone(date) {
  return (date && moment(date).tz(timezone).format()) || null;
}
