import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CardAction { action }

class CardActionCreator {
  static Action onAction() {
    return const Action(CardAction.action);
  }
}
