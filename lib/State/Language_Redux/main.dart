/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/State/Language_Redux/redux_state.dart';
import 'package:flutter_demo/State/Language_Redux/first_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/State/Language_Redux/localization_delegate.dart';
import 'package:flutter_demo/State/Language_Redux/locale_redux.dart';

main() {
  /// 创建全局Store
  final store = Store<ReduxState>(
      getReduce,
      initialState: ReduxState(
        locale: Locale("zh", 'CN')
      )
  );
  runApp(ReduxDemo3(store,));
}

class ReduxDemo3 extends StatelessWidget {

  final Store<ReduxState> store;
  ReduxDemo3(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        /// StoreBuilder后要跟上我们定义的那个State类，要不会报错，
        child: StoreBuilder<ReduxState>(builder: (BuildContext context, Store<ReduxState> store){
          return MaterialApp(
            title: 'ReduxDemo3',
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FZLocalizationDelegate.delegate
            ],
            /// 这边设置 locale 主要是为了在项目里手动更改语言，如果是不想手动变更，而是要随系统自动变更可以注释
            locale: store.state.locale,
            supportedLocales: [
              const Locale('en', 'US'), // 美国英语
              const Locale('zh', 'CN'), // 中文简体
            ],
            /// 监听系统语言切换
            localeListResolutionCallback: (deviceLocale, supportedLocales){
              print('deviceLocale: $deviceLocale');
              // 系统语言是英语： deviceLocale: [en_CN, en_CN, zh_Hans_CN]
              // 系统语言是中文： deviceLocale: [zh_CN, zh_Hans_CN, en_CN]
              print('supportedLocales: $supportedLocales');

              /// 系统自动检测到语言后修改Store里的语言
              if (deviceLocale.length > 0) {
                if (store.state.locale.languageCode != deviceLocale[0].languageCode) {
                  store.dispatch(LocaleRefreshAction(deviceLocale[0]));
                }
              }
            },
            home: FirstPage(),
          );
        })
    );
  }
}
