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
    apiKey: 'AIzaSyC6zllv3bt1-7kY3-5LP_GracRfpxJNoxk',
    appId: '1:515783428985:web:b1f668fee7670dab7bfda8',
    messagingSenderId: '515783428985',
    projectId: 'portfolio-blog-platform',
    authDomain: 'portfolio-blog-platform.firebaseapp.com',
    storageBucket: 'portfolio-blog-platform.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh2ZsnAKGy40tiKXv1hb3SoT5U1e70bYo',
    appId: '1:515783428985:android:47880635d8b1dd4e7bfda8',
    messagingSenderId: '515783428985',
    projectId: 'portfolio-blog-platform',
    storageBucket: 'portfolio-blog-platform.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAAQ3_KRjoanuuzKXUHqGWpMKYkNLFZl8',
    appId: '1:515783428985:ios:d17a05a28346a8867bfda8',
    messagingSenderId: '515783428985',
    projectId: 'portfolio-blog-platform',
    storageBucket: 'portfolio-blog-platform.appspot.com',
    iosClientId: '515783428985-e5pnfrs9dhfr3rlig20fmdkipoc36squ.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAAQ3_KRjoanuuzKXUHqGWpMKYkNLFZl8',
    appId: '1:515783428985:ios:df3105c108fa838b7bfda8',
    messagingSenderId: '515783428985',
    projectId: 'portfolio-blog-platform',
    storageBucket: 'portfolio-blog-platform.appspot.com',
    iosClientId: '515783428985-pnvsjtsms3129dk58oq3paqibnujtp1t.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFrontend.RunnerTests',
  );
}
