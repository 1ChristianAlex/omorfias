import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISecureStorage {
  Future<String> getToken();
  Future<void> setValue(String keyValue, String value);
  Future<void> deleteValue(String keyValue);
}

class SecureStorage implements ISecureStorage {
  static final SecureStorage _singleton = SecureStorage._internal();
  final _storage = new FlutterSecureStorage();

  Future<String> getToken() async {
    await _storage.write(key: 'token', value: 'value');

    String data = await _storage.read(key: 'token');
    return data;
  }

  Future<void> setValue(String keyValue, String value) async {
    await _storage.write(key: keyValue, value: value);
  }

  SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  Future<void> deleteValue(String keyValue) async {
    await _storage.delete(key: keyValue);
  }
}
