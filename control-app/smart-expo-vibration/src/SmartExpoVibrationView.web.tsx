import * as React from 'react';

import { SmartExpoVibrationViewProps } from './SmartExpoVibration.types';

export default function SmartExpoVibrationView(props: SmartExpoVibrationViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        src={props.url}
        onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
