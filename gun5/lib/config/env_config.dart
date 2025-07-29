import 'dart:io';

class EnvConfig {
  static Map<String, String> _envVars = {};

  static Future<void> load() async {
    try {
      final file = File('.env');
      if (await file.exists()) {
        final lines = await file.readAsLines();
        for (String line in lines) {
          if (line.isNotEmpty && !line.startsWith('#')) {
            final keyValue = line.split('=');
            if (keyValue.length == 2) {
              _envVars[keyValue[0].trim()] = keyValue[1].trim();
            }
          }
        }
      }
    } catch (e) {
      print('Error loading .env file: $e');
    }
  }

  static String get firebaseApiKeyWeb => _envVars['FIREBASE_API_KEY_WEB'] ?? '';
  static String get firebaseApiKeyAndroid =>
      _envVars['FIREBASE_API_KEY_ANDROID'] ?? '';
  static String get firebaseApiKeyIos => _envVars['FIREBASE_API_KEY_IOS'] ?? '';

  static String get firebaseProjectId => _envVars['FIREBASE_PROJECT_ID'] ?? '';
  static String get firebaseMessagingSenderId =>
      _envVars['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseStorageBucket =>
      _envVars['FIREBASE_STORAGE_BUCKET'] ?? '';
  static String get firebaseAuthDomain =>
      _envVars['FIREBASE_AUTH_DOMAIN'] ?? '';

  static String get firebaseAppIdWeb => _envVars['FIREBASE_APP_ID_WEB'] ?? '';
  static String get firebaseAppIdAndroid =>
      _envVars['FIREBASE_APP_ID_ANDROID'] ?? '';
  static String get firebaseAppIdIos => _envVars['FIREBASE_APP_ID_IOS'] ?? '';
  static String get firebaseAppIdWindows =>
      _envVars['FIREBASE_APP_ID_WINDOWS'] ?? '';

  static String get firebaseMeasurementIdWeb =>
      _envVars['FIREBASE_MEASUREMENT_ID_WEB'] ?? '';
  static String get firebaseMeasurementIdWindows =>
      _envVars['FIREBASE_MEASUREMENT_ID_WINDOWS'] ?? '';

  static String get iosBundleId => _envVars['IOS_BUNDLE_ID'] ?? '';
}
