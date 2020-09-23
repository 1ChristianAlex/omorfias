import 'package:omorfias/model/user.dart';

class Login {
  final String email;
  final String password;

  Login({this.email, this.password});
}

class LoginResponse {
  final String token;
  final User user;

  LoginResponse({this.token, this.user});

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      token: json['token'],
      user: json['user'],
    );
  }
}
