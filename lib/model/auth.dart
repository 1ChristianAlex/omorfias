import 'package:omorfias/model/user.dart';

class Login {
  final String email;
  final String password;

  Login({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJsonData() => {
        'email': email,
        'password': password,
      };
}

class LoginResponse {
  final String token;
  final User user;

  LoginResponse({this.token, this.user});

  Map<String, dynamic> toJsonData() => {
        'token': token,
        'user': user.toJsonData(),
      };

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}

class Register {
  final String name;
  final String lastName;
  final String email;
  final String userName;
  final String password;

  Register(this.name, this.lastName, this.email, this.userName, this.password);

  Map<String, dynamic> toJsonData() => {
        'name': name,
        'lastName': lastName,
        'email': email,
        'userName': userName,
        'password': password,
      };
}
