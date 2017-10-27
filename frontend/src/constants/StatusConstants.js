// We switched these to integers to match DB values to match the DB.
// It would be nice if we used Symbols instead.
// Ex:
//    export const LONGTERM = Symbol("LONGTERM");

export const OPEN = 1;
export const CLOSED = 2;
export const CAUTION = 3;
export const LONGTERM = 4;

export const strings = {
  1: 'Open',
  3: 'Caution',
  2: 'Closed',
  4: 'Long Term Closure'
};

export const displayedInputs = {
  1: {
    'notes': true,
    'reason': false,
    'duration': false,
  },
  2: {
    'notes': true,
    'reason': true,
    'duration': false,
  },
  3: {
    'notes': true,
    'reason': true,
    'duration': false,
  },
  4: {
    'notes': true,
    'reason': true,
    'duration': true,
  },
}
