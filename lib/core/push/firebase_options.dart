import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Firebase project `surebenefits-2fabd` (the iSure / Sure Benefits project).
/// Values copied from `android/app/google-services.json` and
/// `ios/Runner/GoogleService-Info.plist`; they are public client ids.
/// Passing them in code means neither the Google Services Gradle plugin nor
/// adding the plist to the Xcode target is needed.
abstract final class SureFirebaseOptions {
  static FirebaseOptions? get currentPlatform =>
      switch (defaultTargetPlatform) {
        TargetPlatform.android => android,
        TargetPlatform.iOS => ios,
        _ => null,
      };

  static const android = FirebaseOptions(
    apiKey: 'AIzaSyBrnsj0s-2ohuLw8r5L_0HSei0ZzOwKVK0',
    appId: '1:354014334141:android:b2f7b96001f3f30da1fbd4',
    messagingSenderId: '354014334141',
    projectId: 'surebenefits-2fabd',
    databaseURL: 'https://surebenefits-2fabd-default-rtdb.firebaseio.com',
    storageBucket: 'surebenefits-2fabd.appspot.com',
  );

  static const ios = FirebaseOptions(
    apiKey: 'AIzaSyA8PnjdWut13oIQNeE5GvdeEw-QPB2a1Zk',
    appId: '1:354014334141:ios:edc36117f84be211a1fbd4',
    messagingSenderId: '354014334141',
    projectId: 'surebenefits-2fabd',
    storageBucket: 'surebenefits-2fabd.appspot.com',
    iosBundleId: 'com.isuremyanmar.surebenefits.uat',
  );
}
