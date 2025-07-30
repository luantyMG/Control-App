// Reexport the native module. On web, it will be resolved to SmartExpoVibrationModule.web.ts
// and on native platforms to SmartExpoVibrationModule.ts
export { default } from './SmartExpoVibrationModule';
export { default as SmartExpoVibrationView } from './SmartExpoVibrationView';
export * from  './SmartExpoVibration.types';
