import React from 'react';
import classnames from 'classnames';

import Button, { ButtonPropTypes } from './Button';

export default function ButtonSecondary({ className, ...props }) {
  return (
    <Button
      className={classnames(className, 'Shared__button--secondary')}
      {...props}
    />
  );
}

ButtonSecondary.propTypes = ButtonPropTypes;
