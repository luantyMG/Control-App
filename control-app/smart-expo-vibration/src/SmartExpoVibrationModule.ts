import { NativeModule, requireNativeModule } from 'expo';

import { SmartExpoVibrationModuleEvents } from './SmartExpoVibration.types';

declare class SmartExpoVibrationModule extends NativeModule<SmartExpoVibrationModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<SmartExpoVibrationModule>('SmartExpoVibration');
