/**
 *  Create by fazi
 *  Date: 2019-06-29
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_demo/State/Language_Redux/more_localization.dart';

final LocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, LocaleRefreshAction>(_refreshLocale)
]);

Locale _refreshLocale(Locale locale, LocaleRefreshAction action) {
  locale = action.locale;
  return locale;
}

class LocaleRefreshAction {
  Locale locale;
  LocaleRefreshAction(this.locale);
}
