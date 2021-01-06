import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class UserBaseState {
  String get name;
  set name(String name);
}

class UserState implements UserBaseState, Cloneable<UserState> {
  // ..name=name;
  @override
  String name;

  @override
  UserState clone() {
    return UserState()..name = name;
  }
}
