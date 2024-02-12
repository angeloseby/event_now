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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCqBwJjErWjcLf-yc7Px8KeyC56ncFEjo8',
    appId: '1:837334499630:web:9a6317b789b69c1a1ffabf',
    messagingSenderId: '837334499630',
    projectId: 'event-now-2024',
    authDomain: 'event-now-2024.firebaseapp.com',
    storageBucket: 'event-now-2024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhpoqTkDfv9QDThc59cdX9Gv7GeFrwOPU',
    appId: '1:837334499630:android:db007123517550e01ffabf',
    messagingSenderId: '837334499630',
    projectId: 'event-now-2024',
    storageBucket: 'event-now-2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1IbPKTZjCR-y3FWc9zjigKHkSyAJSJ6Y',
    appId: '1:837334499630:ios:b686e691f6e76d621ffabf',
    messagingSenderId: '837334499630',
    projectId: 'event-now-2024',
    storageBucket: 'event-now-2024.appspot.com',
    iosBundleId: 'com.example.eventNow',
  );
}
