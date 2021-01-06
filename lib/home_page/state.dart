import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements Cloneable<HomeState> {
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  HomeState clone() {
    return HomeState()
      ..passwordController = passwordController
      ..usernameController = usernameController;
  }
}

HomeState initState(Map<String, dynamic> args) {
  //return HomeState();
  HomeState state = new HomeState();
  state.passwordController = new TextEditingController();
  state.usernameController = new TextEditingController();
  return state;
}
