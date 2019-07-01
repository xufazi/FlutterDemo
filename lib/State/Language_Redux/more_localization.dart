/**
 *  Create by fazi
 *  Date: 2019-07-01
 */

import 'package:flutter/material.dart';

class MoreLocalization {

  final Locale locale;

  MoreLocalization(this.locale);

  static Map<String, BaseLanguage> _localValue = {
    'en' : EnLanguage(),
    'zh' : ChLanguage()
  };

  BaseLanguage get currentLocalized {
    return _localValue[locale.languageCode];
  }

  ///通过 Localizations.of(context,type) 加载当前的 FZLocalizations
  static MoreLocalization of(BuildContext context) {
    return Localizations.of(context, MoreLocalization);
  }
}


/// 中文和英语 语言内容维护
abstract class BaseLanguage {
  String name;
}

class EnLanguage implements BaseLanguage {

  @override
  String name = "This is English";
}

class ChLanguage implements BaseLanguage {

  @override
  String name = "这是中文";
}
