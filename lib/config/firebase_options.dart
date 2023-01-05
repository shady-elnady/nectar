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
    apiKey: "AIzaSyDdNINsP77_RGJtx_6OCCulTLxJAnwWg8E",
    authDomain: "nectar-mac.firebaseapp.com",
    projectId: "nectar-mac",
    storageBucket: "nectar-mac.appspot.com",
    messagingSenderId: "35758590813",
    appId: "1:35758590813:web:d1d83e64a86781d5ee76b4",
    measurementId: "G-B613SKW7VH",
    //
    // authDomain: 'flutterfire-e2e-tests.firebaseapp.com',
    // databaseURL:
    //     'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyAdd2pBzPymYq0d0paMLg5QOmVCBbNPwys",
    authDomain: "nectar-mac.firebaseapp.com",
    projectId: "nectar-mac",
    storageBucket: "nectar-mac.appspot.com",
    messagingSenderId: "35758590813",
    appId: "1:35758590813:web:d1d83e64a86781d5ee76b4",
    measurementId: "G-B613SKW7VH",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDdNINsP77_RGJtx_6OCCulTLxJAnwWg8E",
    authDomain: "nectar-mac.firebaseapp.com",
    projectId: "nectar-mac",
    storageBucket: "nectar-mac.appspot.com",
    messagingSenderId: "35758590813",
    appId: "1:35758590813:web:d1d83e64a86781d5ee76b4",
    measurementId: "G-B613SKW7VH",
    androidClientId:
        '35758590813-00fo62n2eui7gtqm0m38qclup2c2a7l2.apps.googleusercontent.com',
    iosClientId:
        '35758590813-p33pauvocob05bb11qgdci1lr76tmq2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.nectarMac',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyDdNINsP77_RGJtx_6OCCulTLxJAnwWg8E",
    authDomain: "nectar-mac.firebaseapp.com",
    projectId: "nectar-mac",
    storageBucket: "nectar-mac.appspot.com",
    messagingSenderId: "35758590813",
    appId: "1:35758590813:web:d1d83e64a86781d5ee76b4",
    measurementId: "G-B613SKW7VH",
    androidClientId:
        '35758590813-00fo62n2eui7gtqm0m38qclup2c2a7l2.apps.googleusercontent.com',
    iosClientId:
        '35758590813-p33pauvocob05bb11qgdci1lr76tmq2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.nectarMac',
  );
}
