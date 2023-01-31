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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBwpPsHUCWn-jEfZg5_HPSO2xa0w6kxU1Y',
    appId: '1:979686595794:web:47b1982de4a4e069f0610b',
    messagingSenderId: '979686595794',
    projectId: 'healthcare-app-c7127',
    authDomain: 'healthcare-app-c7127.firebaseapp.com',
    databaseURL: 'https://healthcare-app-c7127-default-rtdb.firebaseio.com',
    storageBucket: 'healthcare-app-c7127.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJXiud5c20lYpM8oh6an9UOAaDqfIt49E',
    appId: '1:979686595794:android:cc828e56a00be85bf0610b',
    messagingSenderId: '979686595794',
    projectId: 'healthcare-app-c7127',
    databaseURL: 'https://healthcare-app-c7127-default-rtdb.firebaseio.com',
    storageBucket: 'healthcare-app-c7127.appspot.com',
  );
}