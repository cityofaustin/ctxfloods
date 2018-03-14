import moment from 'moment';

export default function Hour({
  date
}) {
  return moment(date).format('h:mm A');
}
