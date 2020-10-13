import 'package:omorfias/model/auth.dart';
import 'package:omorfias/model/user.dart';

abstract class IAuthService {
  Future<User> login(Login login);
  Future<void> logout();
  Future<User> register(Register userRegister);
}
