import 'package:fish_redux/fish_redux.dart';
import 'package:flutterdemo/user_store/state.dart';

class IndexState implements Cloneable<IndexState>, UserBaseState {
  @override
  IndexState clone() {
    return IndexState()..name = name;
  }

  @override
  String name;
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
