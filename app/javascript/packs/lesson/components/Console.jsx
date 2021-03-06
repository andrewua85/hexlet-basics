import React from 'react';
import { useSelector } from 'react-redux';
import { useTranslation } from 'react-i18next';
import cn from 'classnames';

import { checkInfoSliceName } from '../slices/index.js';
import { checkInfoStates } from '../utils/stateMachines.js';

const Console = () => {
  const checkInfo = useSelector((state) => state[checkInfoSliceName]);
  const { t } = useTranslation();

  if (checkInfoStates.checked !== checkInfo.processState) {
    return null;
  }

  const message = t(`check.${checkInfo.result}.message`);
  const alertClassName = cn('mt-auto text-center alert', {
    'alert-success': checkInfo.passed,
    'alert-warning': !checkInfo.passed,
  });
  return (
    <div className="d-flex flex-column h-100">
      <pre>
        <code className="nohighlight" dangerouslySetInnerHTML={{ __html: checkInfo.output }} />
      </pre>
      <div className={alertClassName}>{message}</div>
    </div>
  );
};

export default Console;
