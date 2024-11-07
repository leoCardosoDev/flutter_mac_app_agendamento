import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AppSecureStorageKeys { sessionToken }

class AppSecureStorage {
  final FlutterSecureStorage _secureStorage;
  AppSecureStorage(this._secureStorage);

  Future<String?> getSessionToken() {
    return _secureStorage.read(key: AppSecureStorageKeys.sessionToken.name);
  }

  Future<void> saveSessionToken(String token) {
    return _secureStorage.write(
      key: AppSecureStorageKeys.sessionToken.name,
      value: token,
    );
  }
}
