import 'package:firebase_messaging/firebase_messaging.dart';

class AppMessaging {
  final FirebaseMessaging _messaging;
  AppMessaging(this._messaging) {
    _configureMessaging();
  }

  Future<void> _configureMessaging() async {
    await _messaging.requestPermission();
    final token = await _messaging.getToken();
    print('TOKEN => $token');

    FirebaseMessaging.onMessage.listen((message) {
      print(message.data);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Navegar para a ${message.data['page']}');
    });

    final message = await _messaging.getInitialMessage();
    print('DESLIGADO: ${message?.data}');
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
