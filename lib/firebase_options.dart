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
    apiKey: 'AIzaSyCsuAPmRRhhvAUmWF4cs64Xp9OiBocpOfc',
    appId: '1:1051624362047:web:cec0a031d6ac76b3eee88a',
    messagingSenderId: '1051624362047',
    projectId: 'rumahidamanku-83f07',
    authDomain: 'rumahidamanku-83f07.firebaseapp.com',
    storageBucket: 'rumahidamanku-83f07.appspot.com',
    measurementId: 'G-6CBFWXHZ9D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0vlhgVRvRpdA2nFtC_lIBN_Vnyi4g1_0',
    appId: '1:1051624362047:android:88bc0fd672d63fbdeee88a',
    messagingSenderId: '1051624362047',
    projectId: 'rumahidamanku-83f07',
    storageBucket: 'rumahidamanku-83f07.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHWwVgNROoLnDztvfMwruSCC0QZ1p7EnQ',
    appId: '1:1051624362047:ios:47f78153b224e766eee88a',
    messagingSenderId: '1051624362047',
    projectId: 'rumahidamanku-83f07',
    storageBucket: 'rumahidamanku-83f07.appspot.com',
    iosClientId: '1051624362047-l1or8vt9o97hg4gkvoo3im3p9dolfdin.apps.googleusercontent.com',
    iosBundleId: 'com.kimi.rumahIdamanku',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHWwVgNROoLnDztvfMwruSCC0QZ1p7EnQ',
    appId: '1:1051624362047:ios:47f78153b224e766eee88a',
    messagingSenderId: '1051624362047',
    projectId: 'rumahidamanku-83f07',
    storageBucket: 'rumahidamanku-83f07.appspot.com',
    iosClientId: '1051624362047-l1or8vt9o97hg4gkvoo3im3p9dolfdin.apps.googleusercontent.com',
    iosBundleId: 'com.kimi.rumahIdamanku',
  );
}
