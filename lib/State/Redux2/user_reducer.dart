/**
 *  Create by fazi
 *  Date: 2019-06-27
 */
import 'package:redux/redux.dart';
import "package:flutter_demo/State/Redux2/user.dart";

/// 这里combineReducers的作用是把action和函数绑定起来，
/// 免去了写例如if (action is IncreaseAction)之类的判断语句。
/// 对应的action执行对应的函数。
final UserReducer = combineReducers<User>([
  TypedReducer<User, AddUserAction>(_add),
  TypedReducer<User, UpdateUserAction>(_update),
]);

/// 定义了一个要与AddUserAction绑定一起函数
/// 该函数的作用主要是修改数据，就是之前的if和else里各自要处理的逻辑
User _add(User user, AddUserAction addAction) {
  addAction.user.name = "小明";
  user = addAction.user;
  return user;
}

/// 定义了一个 action AddUserAction
class AddUserAction {
  User user;
  AddUserAction(this.user);
}

/// 定义了一个要与UpdateUserAction绑定一起函数
/// 该函数的作用主要是修改数据，就是之前的if和else里各自要处理的逻辑
User _update(User user, UpdateUserAction updateAction) {
  updateAction.user.name = "匿名";
  user = updateAction.user;
  return user;
}

/// 定义了一个 action UpdateUserAction
class UpdateUserAction {
  User user;
  UpdateUserAction(this.user);
}