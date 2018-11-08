import decode from 'jwt-decode';
import { logError } from './logger';

export function getTokenExpirationDate(token) {
  const decoded = decode(token);
  if (!decoded.exp) {
    return null;
  }
  const date = new Date(0); // The 0 here is the key, which sets the date to the epoch
  date.setUTCSeconds(decoded.exp);
  return date;
}

export function isTokenExpired(token) {
  let date;
  try {
    date = getTokenExpirationDate(token);
  } catch(e) {
    logError(e);
    localStorage.removeItem('jwt_user_token');
    window.location.reload();
  }
  const offsetSeconds = 0;
  if (date === null) {
    return false;
  }
  return !(date.valueOf() > new Date().valueOf() + offsetSeconds * 1000);
}
