import 'dart:convert';

import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';
import 'package:omorfias/enum/AcessLevel.dart';
import 'package:omorfias/model/login.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/service/Adapter.dart';

abstract class ILoginService {
  Future<User> login(Login login);
}

class LoginService implements ILoginService {
  Adapter _adapter;
  SecureStorage _secureStorage;

  LoginService() {
    this._adapter = Adapter(Client());
    this._secureStorage = SecureStorage();
  }

  Future<User> login(Login login) async {
    // final respose = await _adapter.postMethod('/login', jsonEncode(login));
    final respose = {
      'token': 'token',
      'user': {
        'id': 1,
        'accessLevel': AccessLevel.serviceConsumer,
        'name': 'Christian',
        'lastName': 'Alexsander',
        'userName': 'Chris'
      }
    };

    LoginResponse loginResponse = LoginResponse.fromJson(respose);
    _secureStorage.setToken('token', loginResponse.token);

    return loginResponse.user;
  }
}
