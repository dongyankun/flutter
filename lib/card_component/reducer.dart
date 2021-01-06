import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CardState> buildReducer() {
  return asReducer(
    <Object, Reducer<CardState>>{
      CardAction.action: _onAction,
    },
  );
}

CardState _onAction(CardState state, Action action) {
  final CardState newState = state.clone();
  return newState;
}
