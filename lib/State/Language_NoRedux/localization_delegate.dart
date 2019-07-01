/**
 *  Create by fazi
 *  Date: 2019-07-01
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/State/Language_NoRedux/more_localization.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class FZLocalizationDelegate extends LocalizationsDelegate<MoreLocalization> {

  FZLocalizationDelegate();

  ///是否支持某个Local
  ///支持中文和英语
  @override
  bool isSupported(Locale locale) {
    return ['zh', 'en'].contains(locale.languageCode);
  }

  ///shouldReload的返回值决定当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
  @override
  bool shouldReload(LocalizationsDelegate<MoreLocalization> old) {
    return false;
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  ///Flutter会调用此类加载相应的Locale资源类
  @override
  Future<MoreLocalization> load(Locale locale) {
    return SynchronousFuture<MoreLocalization>(
        MoreLocalization(locale)
    );
  }

  static FZLocalizationDelegate delegate = FZLocalizationDelegate();
}
