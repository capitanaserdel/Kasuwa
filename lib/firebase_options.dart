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
    apiKey: 'AIzaSyDO99Q5nW_ZRpG_ifnXM8AQMhomVlYL63k',
    appId: '1:846740244423:web:b9464a0009ba3f64913be2',
    messagingSenderId: '846740244423',
    projectId: 'kasuwadb-787d9',
    authDomain: 'kasuwadb-787d9.firebaseapp.com',
    storageBucket: 'kasuwadb-787d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_h42jfTHtU572uv_BxTHIjoKFfag6GVo',
    appId: '1:846740244423:android:c069503e2e510662913be2',
    messagingSenderId: '846740244423',
    projectId: 'kasuwadb-787d9',
    storageBucket: 'kasuwadb-787d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA84ZLdJENZRuEjLsJNW5ab0zqn7adzGfs',
    appId: '1:846740244423:ios:62200ebd509e5d0c913be2',
    messagingSenderId: '846740244423',
    projectId: 'kasuwadb-787d9',
    storageBucket: 'kasuwadb-787d9.appspot.com',
    iosClientId: '846740244423-1fg9mpfi5cle28f9rgicm7f4cpeh07pj.apps.googleusercontent.com',
    iosBundleId: 'com.example.kasuwa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA84ZLdJENZRuEjLsJNW5ab0zqn7adzGfs',
    appId: '1:846740244423:ios:62200ebd509e5d0c913be2',
    messagingSenderId: '846740244423',
    projectId: 'kasuwadb-787d9',
    storageBucket: 'kasuwadb-787d9.appspot.com',
    iosClientId: '846740244423-1fg9mpfi5cle28f9rgicm7f4cpeh07pj.apps.googleusercontent.com',
    iosBundleId: 'com.example.kasuwa',
  );
}
