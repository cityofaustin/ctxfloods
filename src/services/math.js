import Big from 'big.js';

const compare = (x, op, y) => {
  if (isNaN(x) || isNaN(y)) {
    throw new Error("Inputs must be numbers")
  }
  x = new Big(x);
  y = new Big(y);
  return x[op](y);
}

export default compare;
