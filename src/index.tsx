import {NativeModules, Platform} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-webview-ios-cache-clear' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ios: "- You have run 'pod install'\n", default: ''}) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const WebviewIosCacheClear = NativeModules.WebviewIosCacheClear
  ? NativeModules.WebviewIosCacheClear
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      },
    );

export function clearWebViewIOSCache(): Promise<number> {
  return WebviewIosCacheClear.clearWebViewIOSCache();
}
