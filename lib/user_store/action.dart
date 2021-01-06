import 'package:fish_redux/fish_redux.dart';

enum UserAction { changeName }

class UserStateActionCreator {
  static Action onchangeName(String name) {
    return Action(UserAction.changeName, payload: name);
  }
}
