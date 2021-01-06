import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
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
        title: Text('登录'),
      ),
    ),
    body: GestureDetector(
      onTap: () =>
          FocusScope.of(viewService.context).requestFocus(new FocusNode()),
      child: Container(
          padding: EdgeInsets.fromLTRB(15, 50, 15, 10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: state.usernameController,
                  decoration: InputDecoration(hintText: '请输入账号'),
                ))
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: TextField(
                  obscureText: false,
                  controller: state.passwordController,
                  decoration: InputDecoration(hintText: '请输入密码'),
                ))
              ]),
              RaisedButton(
                color: Colors.blue,
                child: Text('登录'),
                onPressed: () {
                  dispatch(HomeActionCreator.onLogin());
                },
              )
            ],
          )
          //child: ListView(children: <Widget>[
          // Row(children: <Widget>[
          //   Expanded(child: TextField(
          //     controller: state.usernameController,
          //     decoration: InputDecoration(hintText: '请输入账号'),
          //   ))
          // ],),
          //  Row(children: <Widget>[
          //   Expanded(child: TextField(
          //     controller: state.passwordController,
          //     decoration: InputDecoration(hintText: '请输入密码'),
          //   ))
          //],)
          //],)
          //),
          ),
    ),
  );
}
