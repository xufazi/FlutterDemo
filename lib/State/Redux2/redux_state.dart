/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter_demo/State/Redux2/user.dart";
import "package:flutter_demo/State/Redux2/user_reducer.dart";

import "package:flutter_demo/State/Redux2/book.dart";
import "package:flutter_demo/State/Redux2/book_reducer.dart";

/// 定义一个state
class ReduxState {
  
  User user;
  Book book;
  
  ReduxState({this.user, this.book});
  
}

/// 定义action，将action放到User类里去定义

/// 定义reducer
ReduxState getReduce(ReduxState state, action) {
  
  return ReduxState(
    user: UserReducer(state.user, action),
    book: BookReducer(state.book, action)
  );
}
