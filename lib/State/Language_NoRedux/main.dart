/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/State/Language_NoRedux/first_page.dart';
import 'package:flutter_demo/State/Language_NoRedux/localization_delegate.dart';

main() {
  runApp(ReduxDemo3());
}

class ReduxDemo3 extends StatelessWidget {

  ReduxDemo3();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReduxDemo3',
      localizationsDelegates: [
        /// 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        /// 注册我们的Delegate
        FZLocalizationDelegate.delegate
      ],
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
      },
      home: FirstPage(),
    );
  }
}
