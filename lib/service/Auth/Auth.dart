import 'package:http/http.dart';
import 'package:omorfias/config/SecureStorage.dart';
import 'package:omorfias/model/auth.dart';
import 'package:omorfias/model/user.dart';
import 'package:omorfias/service/Adapter/Adapter.dart';
import 'IAuth.dart';

class AuthService implements IAuthService {
  Adapter _adapter;
  SecureStorage _secureStorage;

  AuthService() {
    this._adapter = Adapter(Client());
    this._secureStorage = SecureStorage();
  }

  Future<User> login(Login login) async {
    final respose = await _adapter.postMethod('/Auth', login.toJsonData());

    LoginResponse loginResponse = LoginResponse.fromJson(respose);
    _secureStorage.setValue('token', loginResponse.token);

    return loginResponse.user;
  }

  Future<void> logout() async {
    await _secureStorage.deleteValue('token');
  }

  Future<User> register(Register registerData) async {
    final respose =
        await _adapter.postMethod('/register', registerData.toJsonData());

    LoginResponse loginResponse = LoginResponse.fromJson(respose);
    _secureStorage.setValue('token', loginResponse.token);

    return loginResponse.user;
  }
}
