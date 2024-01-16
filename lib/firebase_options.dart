// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB67GncWfB7ULScIHqOyrFMXP4DTvrmSkA',
    appId: '1:862288269596:web:58806080e6a3508588aad9',
    messagingSenderId: '862288269596',
    projectId: 'hortel-e5883',
    authDomain: 'hortel-e5883.firebaseapp.com',
    databaseURL: 'https://hortel-e5883-default-rtdb.firebaseio.com',
    storageBucket: 'hortel-e5883.appspot.com',
    measurementId: 'G-2PTLQS78QL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3up_hGbU5JA5-2jdI5WM3_MO8Gv5_dbg',
    appId: '1:862288269596:android:f16d379c40e5ef9788aad9',
    messagingSenderId: '862288269596',
    projectId: 'hortel-e5883',
    databaseURL: 'https://hortel-e5883-default-rtdb.firebaseio.com',
    storageBucket: 'hortel-e5883.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_pC1_cgJHtwcbppqqx6GrrqKyH2-vRHQ',
    appId: '1:862288269596:ios:ed8399acd43bd21a88aad9',
    messagingSenderId: '862288269596',
    projectId: 'hortel-e5883',
    databaseURL: 'https://hortel-e5883-default-rtdb.firebaseio.com',
    storageBucket: 'hortel-e5883.appspot.com',
    iosClientId: '862288269596-4j5dnep34ve874k7gm3guupsibgh9iei.apps.googleusercontent.com',
    iosBundleId: 'com.example.cipher',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_pC1_cgJHtwcbppqqx6GrrqKyH2-vRHQ',
    appId: '1:862288269596:ios:bd0d94f0bc506ccd88aad9',
    messagingSenderId: '862288269596',
    projectId: 'hortel-e5883',
    databaseURL: 'https://hortel-e5883-default-rtdb.firebaseio.com',
    storageBucket: 'hortel-e5883.appspot.com',
    iosClientId: '862288269596-mhrt6gh4422lj8ct75ee2qctodcirf32.apps.googleusercontent.com',
    iosBundleId: 'com.example.cipher.RunnerTests',
  );
}
