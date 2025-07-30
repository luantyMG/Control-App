import { requireNativeView } from 'expo';
import * as React from 'react';

import { SmartExpoVibrationViewProps } from './SmartExpoVibration.types';

const NativeView: React.ComponentType<SmartExpoVibrationViewProps> =
  requireNativeView('SmartExpoVibration');

export default function SmartExpoVibrationView(props: SmartExpoVibrationViewProps) {
  return <NativeView {...props} />;
}
