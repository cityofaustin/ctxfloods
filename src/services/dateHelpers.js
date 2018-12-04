import moment from 'moment';

// 'YYYY-MM-DD' to Date
export function stringToDate(dateString) {
  return dateString ? moment(dateString).toDate() : null;
}

// Date to 'YYYY-MM-DD'
export function dateToString(date) {
  return moment(date).format('YYYY-MM-DD');
}
