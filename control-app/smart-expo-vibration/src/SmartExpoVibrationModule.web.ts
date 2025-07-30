import { registerWebModule, NativeModule } from 'expo';

import { SmartExpoVibrationModuleEvents } from './SmartExpoVibration.types';

class SmartExpoVibrationModule extends NativeModule<SmartExpoVibrationModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
}

export default registerWebModule(SmartExpoVibrationModule, 'SmartExpoVibrationModule');
