import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _singleton = SecureStorage._internal();
  final _storage = new FlutterSecureStorage();

  Future<String> getToken() async {
    await _storage.write(key: 'token', value: 'value');

    String data = await _storage.read(key: 'token');
    return data;
  }

  setToken(String keyValue, String value) async {
    await _storage.write(key: keyValue, value: value);
  }

  SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }
}
