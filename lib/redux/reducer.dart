import 'package:omorfias/model/user.dart';
import 'package:omorfias/redux/actions.dart';
import 'package:omorfias/redux/appState.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(user: userReducer(state.user, action));
}

User userReducer(User user, action) {
  if (action is UpdateUserAction) {
    return user.copyWith(action.user);
  }

  if (action is UpdateUserAction) {
    return User();
  }

  return user;
}
