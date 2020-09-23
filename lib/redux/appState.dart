import 'package:omorfias/model/user.dart';

class AppState {
  final User user;

  AppState({this.user});

  static initialState() {
    return AppState(user: User.initialUser());
  }
}
