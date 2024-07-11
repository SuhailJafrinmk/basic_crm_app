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
    apiKey: 'AIzaSyAGOw2lf2VfL3_PeMEPKHH-plEJJ8i5sXI',
    appId: '1:784807925343:web:6dbe7151e0143bcd352dea',
    messagingSenderId: '784807925343',
    projectId: 'basic-crm-application',
    authDomain: 'basic-crm-application.firebaseapp.com',
    storageBucket: 'basic-crm-application.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq9zs6_IBfhn7Zt4J_HwMNGdUp-n-F_wU',
    appId: '1:784807925343:android:5dfea9613fe674bd352dea',
    messagingSenderId: '784807925343',
    projectId: 'basic-crm-application',
    storageBucket: 'basic-crm-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQvc4baxadJmm69cEgUwL-jdqnZoma8ho',
    appId: '1:784807925343:ios:69cdde5c06cfd70f352dea',
    messagingSenderId: '784807925343',
    projectId: 'basic-crm-application',
    storageBucket: 'basic-crm-application.appspot.com',
    iosBundleId: 'com.example.crmApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQvc4baxadJmm69cEgUwL-jdqnZoma8ho',
    appId: '1:784807925343:ios:69cdde5c06cfd70f352dea',
    messagingSenderId: '784807925343',
    projectId: 'basic-crm-application',
    storageBucket: 'basic-crm-application.appspot.com',
    iosBundleId: 'com.example.crmApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGOw2lf2VfL3_PeMEPKHH-plEJJ8i5sXI',
    appId: '1:784807925343:web:eed647570ee7d980352dea',
    messagingSenderId: '784807925343',
    projectId: 'basic-crm-application',
    authDomain: 'basic-crm-application.firebaseapp.com',
    storageBucket: 'basic-crm-application.appspot.com',
  );
}