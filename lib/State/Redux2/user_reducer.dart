/**
 *  Create by fazi
 *  Date: 2019-06-27
 */
import 'package:redux/redux.dart';
import "package:flutter_demo/State/Redux2/user.dart";

final UserReducer = combineReducers<User>([
  TypedReducer<User, AddUserAction>(_add),
  TypedReducer<User, UpdateUserAction>(_update),
]);

User _add(User user, AddUserAction addAction) {
  addAction.user.name = "小明";
  user = addAction.user;
  return user;
}

class AddUserAction {
  User user;
  AddUserAction(this.user);
}

User _update(User user, UpdateUserAction updateAction) {
  updateAction.user.name = "匿名";
  user = updateAction.user;
  return user;
}

class UpdateUserAction {
  User user;
  UpdateUserAction(this.user);
}