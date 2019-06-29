/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import "package:flutter_demo/State/ThemeData/theme_redux.dart";

/// 定义一个state
class ReduxState {

  ThemeData themeData;
  
  ReduxState({this.themeData});
  
}

/// 定义action，将action放到theme_redux类里去定义

/// 定义reducer
ReduxState getReduce(ReduxState state, action) {
  
  return ReduxState(
    themeData: ThemeDataReducer(state.themeData, action)
  );
}
