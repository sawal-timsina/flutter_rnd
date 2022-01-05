import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl-ta1o-_uoIRKbeMF9p5oJg2VxGN69Zw',
    appId: '1:897408850667:android:c4b84d72e13c6030c43cae',
    messagingSenderId: '897408850667',
    projectId: 'watamuki-development-23100',
    storageBucket: 'watamuki-development-23100.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgvIOp_S-svw1Wz1nrmvQZfJVUec4qxa0',
    appId: '1:897408850667:ios:163652220c5b6c8dc43cae',
    messagingSenderId: '897408850667',
    projectId: 'watamuki-development-23100',
    storageBucket: 'watamuki-development-23100.appspot.com',
    iosClientId:
        '897408850667-8r80jd4b2kpubsj1f3f1cuv99ufv3d16.apps.googleusercontent.com',
    iosBundleId: 'jp.readytowork.watamuki',
  );
}
