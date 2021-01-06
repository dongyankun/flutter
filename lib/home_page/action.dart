import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { login }

class HomeActionCreator {
  static Action onLogin() {
    return const Action(HomeAction.login);
  }
}
