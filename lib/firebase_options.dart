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
    apiKey: 'AIzaSyAdw_VX5wtImZVXtGr5e6EXFQ-T0GsuKc4',
    appId: '1:122345794363:web:049359465667d9edbce51e',
    messagingSenderId: '122345794363',
    projectId: 'fluttertest-bfa3b',
    authDomain: 'fluttertest-bfa3b.firebaseapp.com',
    storageBucket: 'fluttertest-bfa3b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZVTH-sI726kOYfUnSLQmYth6M0Vrrg5Q',
    appId: '1:122345794363:android:472d61fa9b5f9bcdbce51e',
    messagingSenderId: '122345794363',
    projectId: 'fluttertest-bfa3b',
    storageBucket: 'fluttertest-bfa3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGGAXTlpFalTMtSnEduimXm3299jwhgu8',
    appId: '1:122345794363:ios:5c9dc8e5572df02abce51e',
    messagingSenderId: '122345794363',
    projectId: 'fluttertest-bfa3b',
    storageBucket: 'fluttertest-bfa3b.appspot.com',
    iosClientId: '122345794363-ra5n08uqjitu0054nrhchvbc1gjvf04h.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasetest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGGAXTlpFalTMtSnEduimXm3299jwhgu8',
    appId: '1:122345794363:ios:5c9dc8e5572df02abce51e',
    messagingSenderId: '122345794363',
    projectId: 'fluttertest-bfa3b',
    storageBucket: 'fluttertest-bfa3b.appspot.com',
    iosClientId: '122345794363-ra5n08uqjitu0054nrhchvbc1gjvf04h.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebasetest',
  );
}