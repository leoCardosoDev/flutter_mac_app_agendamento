import 'package:firebase_messaging/firebase_messaging.dart';

enum AppMessagingStatus { denied, allowed, notDetermined }

class AppMessaging {
  final FirebaseMessaging _messaging;
  AppMessaging(this._messaging);

  Future<AppMessagingStatus> checkStatus() async {
    final settings = await _messaging.getNotificationSettings();
    settings.authorizationStatus == AuthorizationStatus.authorized;
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized || AuthorizationStatus.provisional:
        return AppMessagingStatus.allowed;
      case AuthorizationStatus.denied:
        return AppMessagingStatus.denied;
      case AuthorizationStatus.notDetermined:
        return AppMessagingStatus.notDetermined;
    }
  }
}
