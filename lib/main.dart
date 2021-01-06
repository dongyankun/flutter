import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/home_page/page.dart';
import 'package:flutterdemo/index_page/page.dart';
import 'package:flutterdemo/user_store/state.dart';
import 'package:flutterdemo/user_store/store.dart';
import 'package:xg_flutter_plugin/xg_flutter_plugin.dart';

void main() => runApp(createApp());
Widget createApp() {
  initState();
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      /// 注册TodoList主页面
      'home': HomePage(),
      "index": IndexPage()
    },
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<UserBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<UserBaseState>(UserStore.store,
            (Object pagestate, UserBaseState appState) {
          final UserBaseState p = pagestate;
          if (p.name != appState.name) {
            if (pagestate is Cloneable) {
              final Object copy = pagestate.clone();
              final UserBaseState newState = copy;
              newState.name = appState.name;
              return newState;
            }
          }
          return pagestate;
        });
      }

      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      //   page.enhancer.append(
      //     /// View AOP
      //     viewMiddleware: <ViewMiddleware<dynamic>>[
      //       safetyView<dynamic>(),
      //     ],

      //     /// Adapter AOP
      //     adapterMiddleware: <AdapterMiddleware<dynamic>>[
      //       safetyAdapter<dynamic>()
      //     ],

      //     /// Effect AOP
      //     effectMiddleware: <EffectMiddleware<dynamic>>[
      //       _pageAnalyticsMiddleware<dynamic>(),
      //     ],

      //     /// Store AOP
      //     middleware: <Middleware<dynamic>>[
      //       logMiddleware<dynamic>(tag: page.runtimeType.toString()),
      //     ],
      //   );
    },
  );

  return MaterialApp(
    title: 'Fluro',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        ScreenUtil.init(context, width: 750, height: 1334);
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
// EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
//   return (AbstractLogic<dynamic> logic, Store<T> store) {
//     return (Effect<dynamic> effect) {
//       return (Action action, Context<dynamic> ctx) {
//         if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
//           print('${logic.runtimeType} ${action.type.toString()} ');
//         }
//         return effect?.call(action, ctx);
//       };
//     };
//   };
// }
@override
void initState() {
  //super.initState();
  // 这里初始化腾讯信鸽服务
  initXgPushState();
}

// 初始化腾讯信鸽推送
Future<void> initXgPushState() async {
  String xgSdkVersion;
  try {
    // 【BUG1】这里在安卓端是有一个bug，获取不到version。后面会说到
    xgSdkVersion = await XgFlutterPlugin.xgSdkVersion;
  } catch (e) {
    print("push error:" + e.toString());
  }

  // 调试模式，默认为false
  XgFlutterPlugin().setEnableDebug(false);

  // 注册推送服务
  XgFlutterPlugin.xgApi.regPush();

  // 【BUG2】获取信鸽推送的token。这里在安卓端也是有一个bug。后面会说到
  String xgToken = await XgFlutterPlugin.xgToken;

  XgFlutterPlugin().addEventHandler(
      onRegisteredDeviceToken: (String msg) async {
    // 获取设备token回调（在注册成功里面获取的）
  }, onRegisteredDone: (String msg) async {
    // 注册成功回调
  }, unRegistered: (String msg) async {
    // 反注册回调
  }, onReceiveNotificationResponse: (Map<String, dynamic> msg) async {
    // 收到通知回调
  }, onReceiveMessage: (Map<String, dynamic> msg) async {
    // 收到透传通知回调
  }, xgPushDidSetBadge: (String msg) async {
    // 设置角标回调，仅仅IOS可用（这边我们只在安卓端使用），这个可以不要
  }, xgPushDidBindWithIdentifier: (String msg) async {
    // 绑定账号跟标签回调
  }, xgPushDidUnbindWithIdentifier: (String msg) async {
    // 解绑账号跟标签回调
  }, xgPushDidUpdatedBindedIdentifier: (String msg) async {
    // 更新账号跟标签回调
  }, xgPushDidClearAllIdentifiers: (String msg) async {
    // 清除账号跟标签回调
  }, xgPushClickAction: (Map<String, dynamic> msg) async {
    // 通知点击事件回调
  });
}
