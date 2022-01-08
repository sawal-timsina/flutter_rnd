import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions options(Map<dynamic, dynamic> options) {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    FirebaseOptions base = FirebaseOptions(
      appId: options["APP_ID"],
      apiKey: options["API_KEY"],
      projectId: options["PROJECT_ID"],
      storageBucket: options["STORAGE_BUCKET"],
      messagingSenderId: options["MESSAGING_SENDER_ID"],
    );

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return base;
      case TargetPlatform.iOS:
        return FirebaseOptions.fromMap({
          ...base.asMap,
          "iosBundleId": options["IOS_BUNDLE_ID"],
          "iosClientId": options["IOS_CLIENT_ID"],
        });
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
