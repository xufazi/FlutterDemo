/**
 *  Create by fazi
 *  Date: 2019-06-29
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';

final ThemeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, ThemeRefreshAction>(_refreshTheme)
]);

ThemeData _refreshTheme(ThemeData themeData, ThemeRefreshAction action) {
  themeData = action.themeData;
  return themeData;
}

class ThemeRefreshAction {
  ThemeData themeData;
  ThemeRefreshAction(this.themeData);
}
