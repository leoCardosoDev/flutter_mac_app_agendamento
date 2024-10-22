import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class AppMessaging {
  final FirebaseMessaging _messaging;
  AppMessaging(this._messaging) {
    _configureMessaging();
  }

  Future<void> _configureMessaging() async {
    await _messaging.requestPermission();
    final token = await _messaging.getToken();
    debugPrint('TOKEN => $token');

    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('${message.data}');
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('Navegar para a ${message.data['page']}');
    });

    final message = await _messaging.getInitialMessage();
    debugPrint('DESLIGADO: ${message?.data}');
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
}
