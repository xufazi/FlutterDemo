/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter_demo/State/Middleware/user.dart";
import "package:flutter_demo/State/Middleware/user_reducer.dart";
import 'package:redux/redux.dart';

/// 定义一个state
class ReduxState {
  
  User user;
  
  ReduxState({this.user});
  
}

/// 定义action，将action放到User类里去定义

/// 定义reducer
ReduxState getReduce(ReduxState state, action) {
  
  return ReduxState(
    user: UserReducer(state.user, action)
  );
}

/// 定义了一个中间件
final List<Middleware<ReduxState>> middleware = [
  UserInfoMiddleware(),
];
