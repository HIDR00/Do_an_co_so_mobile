import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../shared.dart';

// Alternative experimental utility
class FirebaseMessagingUtil {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<bool> isNotificationEnabled() async {
    final settings = await messaging.getNotificationSettings();
    // check if any of the notification types are disabled
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return false;
    }
    if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      return false;
    }

    return true;
  }

  static Future<AuthorizationStatus> getNotificationStatus() async {
    final settings = await messaging.getNotificationSettings();

    return settings.authorizationStatus;
  }

  static Future<bool> isNotificationSupported() async {
    final settings = await messaging.getNotificationSettings();
    // check if any of the notification types are disabled
    bool supported = true;

    if (settings.alert == AppleNotificationSetting.notSupported) {
      supported = false;
    }
    if (settings.badge == AppleNotificationSetting.notSupported) {
      supported = false;
    }

    return supported;
  }

  static Future<AuthorizationStatus> enableNotifcation() async {
    try {
      final setting = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        sound: true,
      );
      await getToken();

      return setting.authorizationStatus;
    } catch (e) {
      Log.e(e);

      return AuthorizationStatus.notDetermined;
    }
  }

  static Future<String?> getToken() async {
    try {
      final token = await messaging.getToken();
      if (kDebugMode) {
        Log.d('Firebase Messaging Token: $token');
      }
      return token;
    } catch (e) {

      return null;
    }
  }

  /// Handle remote message notification from firebase.
  /// The action will be called when the app is in foreground.
  static Future<void> onMessage(
    Future<void> Function(
      RemoteMessage message,
    )
        action,
  ) async {
    FirebaseMessaging.onMessage.listen(action);
  }

  /// Handle click on notification when the app is in background.
  static Future<void> onNotificationClick(
    Future<void> Function(
      RemoteMessage message,
    )
        action,
  ) async {
    FirebaseMessaging.onMessageOpenedApp.listen(action);
  }
}
