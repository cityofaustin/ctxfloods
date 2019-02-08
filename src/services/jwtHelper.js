import decode from 'jwt-decode';
import moment from 'moment';

// Check if token is a real token and not expired.
export function isTokenValid(token) {
  let decoded;
  try {
    decoded = decode(token);
  } catch(err) {
    return false
  }
  if (decoded.exp) {
    // Check if token has expired
    return (decoded.exp > moment().format('X'));
  } else {
    return true
  }
}

// Check if token is a valid token
export function isTokenReal(token) {
  try {
    decode(token);
    return true
  } catch(err) {
    return false
  }
}
