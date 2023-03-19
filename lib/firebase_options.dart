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
    apiKey: 'AIzaSyCAAWLQiQ20r4GRLz4hqdX9BjSprC9PE4s',
    appId: '1:344009577378:web:29e04da7cd98316c0498fb',
    messagingSenderId: '344009577378',
    projectId: 'flutter-firebase-pr',
    authDomain: 'flutter-firebase-pr.firebaseapp.com',
    databaseURL: 'https://flutter-firebase-pr-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-pr.appspot.com',
    measurementId: 'G-97L45B6EZT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuWy1EFTwUsJLUhDqUAaPXI0awRa-pJq0',
    appId: '1:344009577378:android:7cb4de41dba3e3350498fb',
    messagingSenderId: '344009577378',
    projectId: 'flutter-firebase-pr',
    databaseURL: 'https://flutter-firebase-pr-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-pr.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzJrkJJKGBgAiIXSkXepcvyE-4-qKxllU',
    appId: '1:344009577378:ios:a7bf7998bcbe344b0498fb',
    messagingSenderId: '344009577378',
    projectId: 'flutter-firebase-pr',
    databaseURL: 'https://flutter-firebase-pr-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-pr.appspot.com',
    androidClientId: '344009577378-283i0s6o9qdtvg5od4q2i036qt6rhnes.apps.googleusercontent.com',
    iosClientId: '344009577378-ogllqncbvblrr46aaditmnc4b9eprmj9.apps.googleusercontent.com',
    iosBundleId: 'com.darazcloneapp.darazCloneApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzJrkJJKGBgAiIXSkXepcvyE-4-qKxllU',
    appId: '1:344009577378:ios:a7bf7998bcbe344b0498fb',
    messagingSenderId: '344009577378',
    projectId: 'flutter-firebase-pr',
    databaseURL: 'https://flutter-firebase-pr-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-firebase-pr.appspot.com',
    androidClientId: '344009577378-283i0s6o9qdtvg5od4q2i036qt6rhnes.apps.googleusercontent.com',
    iosClientId: '344009577378-ogllqncbvblrr46aaditmnc4b9eprmj9.apps.googleusercontent.com',
    iosBundleId: 'com.darazcloneapp.darazCloneApp',
  );
}
