import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  final FlutterSecureStorage _secureStorage;
  AppSecureStorage(this._secureStorage);

  Future<String?> getSessionToken() {
    return _secureStorage.read(key: 'sessionToken');
  }
}
