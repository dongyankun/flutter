import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'state.dart';

Reducer<UserState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserState>>{
      UserAction.changeName: _changeName,
    },
  );
}

UserState _changeName(UserState state, Action action) {
  return state.clone()..name = action.payload;
}
