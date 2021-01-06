import 'package:fish_redux/fish_redux.dart';
import 'reducer.dart';
import 'state.dart';

/// 建立一个AppStore
/// 目前它的功能只有切换主题
class UserStore {
  static Store<UserState> _globalStore;

  static Store<UserState> get store =>
      _globalStore ??= createStore<UserState>(UserState(), buildReducer());
  static set store(Store<UserState> store) {
    _globalStore = store;
  }
}

// class GlobalStore { // Store 用来存储全局状态 GlobalState，当刷新状态值的时候，通过 // store 的 dispatch 发送相关的 action 即可做出相应的调整 static Store<GlobalState> _globalStore; static Store<GlobalState> get store => _globalStore ??= createStore(
//         GlobalState(),
//         buildReducer(), // reducer 用来刷新状态值 );
// } /// action  enum GlobalAction { changeThemeColor, changeLocale, changeFontFamily } class GlobalActionCreator { static Action onChangeThemeColor(Color themeColor) { return Action(GlobalAction.changeThemeColor, payload: themeColor);
//   } static Action onChangeLocale(Locale localization) { return Action(GlobalAction.changeLocale, payload: localization);
//   } static Action onChangeFontFamily(String fontFamily) { return Action(GlobalAction.changeFontFamily, payload: fontFamily);
//   }
// } /// reducer 的作用就是刷新主题色，字体和语言 Reducer<GlobalState> buildReducer() { return asReducer(<Object, Reducer<GlobalState>>{
//     GlobalAction.changeThemeColor: _onThemeChange,
//     GlobalAction.changeLocale: _onLocalChange,
//     GlobalAction.changeFontFamily: _onFontFamilyChange,
//   });
// }

// GlobalState _onThemeChange(GlobalState state, Action action) { return state.clone()..themeColor = action.payload;
// }

// GlobalState _onLocalChange(GlobalState state, Action action) { return state.clone()..localization = action.payload;
// }

// GlobalState _onFontFamilyChange(GlobalState state, Action action) { return state.clone()..fontFamily = action.payload;
