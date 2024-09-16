// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCGnRgyKnq6cc0yu77B23yplgxXuuhU2ic',
    appId: '1:578133163563:web:4814470b6727127a49346e',
    messagingSenderId: '578133163563',
    projectId: 'el-fert',
    authDomain: 'el-fert.firebaseapp.com',
    databaseURL: 'https://el-fert-default-rtdb.firebaseio.com',
    storageBucket: 'el-fert.appspot.com',
    measurementId: 'G-CFJR62CF7N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQIgFLyF8b1xTJFAhwvG63QmTHptKJQLw',
    appId: '1:578133163563:android:c31acb435cd44a5b49346e',
    messagingSenderId: '578133163563',
    projectId: 'el-fert',
    databaseURL: 'https://el-fert-default-rtdb.firebaseio.com',
    storageBucket: 'el-fert.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSmPKM8l1vdCiQYZ_WsAtUJChMUs1NliE',
    appId: '1:578133163563:ios:62910b871a9933c349346e',
    messagingSenderId: '578133163563',
    projectId: 'el-fert',
    databaseURL: 'https://el-fert-default-rtdb.firebaseio.com',
    storageBucket: 'el-fert.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSmPKM8l1vdCiQYZ_WsAtUJChMUs1NliE',
    appId: '1:578133163563:ios:62910b871a9933c349346e',
    messagingSenderId: '578133163563',
    projectId: 'el-fert',
    databaseURL: 'https://el-fert-default-rtdb.firebaseio.com',
    storageBucket: 'el-fert.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGnRgyKnq6cc0yu77B23yplgxXuuhU2ic',
    appId: '1:578133163563:web:9ec1865d83393ad049346e',
    messagingSenderId: '578133163563',
    projectId: 'el-fert',
    authDomain: 'el-fert.firebaseapp.com',
    databaseURL: 'https://el-fert-default-rtdb.firebaseio.com',
    storageBucket: 'el-fert.appspot.com',
    measurementId: 'G-795L5PSNBZ',
  );
}
