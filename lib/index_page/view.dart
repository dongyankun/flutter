import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/user_store/action.dart';
import 'package:flutterdemo/user_store/state.dart';
import 'package:flutterdemo/user_store/store.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  UserState userState = UserStore.store.getState();
  return Scaffold(
      appBar: PreferredSize(
        //通过PreferredSize设置appbar的高度
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          //不显示返回键
          centerTitle: true,
          //是否居中，false靠左，true居中
          // brightness: Brightness.dark,//状态栏字体颜色
          elevation: 0,
          //高度
          title: Text('首页'),
        ),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('登录'),
            onPressed: () {
              UserStore.store
                  .dispatch(UserStateActionCreator.onchangeName('123121321'));
              // dispatch(UserStateActionCreator.)
              //dispatch(state.clone());
            },
          ),
          Text(state.name.toString())
        ],
      ));
}
