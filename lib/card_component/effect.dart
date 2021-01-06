import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CardState> buildEffect() {
  return combineEffects(<Object, Effect<CardState>>{
    CardAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CardState> ctx) {
}
