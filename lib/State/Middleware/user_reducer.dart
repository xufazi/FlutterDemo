/**
 *  Create by fazi
 *  Date: 2019-06-27
 */
import 'package:redux/redux.dart';
import "package:flutter_demo/State/Middleware/user.dart";
import 'package:flutter_demo/State/Middleware/redux_state.dart';
import 'dart:async';
import 'dart:io';

/// 这里combineReducers的作用是把action和函数绑定起来，
/// 免去了写例如if (action is IncreaseAction)之类的判断语句。
/// 对应的action执行对应的函数。
final UserReducer = combineReducers<User>([
  TypedReducer<User, AddUserAction>(_add),
  TypedReducer<User, UpdateUserAction>(_update),
  TypedReducer<User, DeleteUserAction>(_delete)
]);

/// 定义了一个要与AddUserAction绑定一起函数
/// 该函数的作用主要是修改数据，就是之前的if和else里各自要处理的逻辑
User _add(User user, AddUserAction addAction) {
  print("开始执行AddUserAction的逻辑：添加用户");
  addAction.user.name = "小明";
  user = addAction.user;
  return user;
}

/// 定义了一个 action AddUserAction
class AddUserAction {
  User user;
  AddUserAction(this.user);
}

User _update(User user, UpdateUserAction updateAction) {
  print("开始执行UpdateUserAction的逻辑：更新用户");
  updateAction.user.name = "小红";
  user = updateAction.user;
  return user;
}

/// 定义了一个 action UpdateUserAction
class UpdateUserAction {
  User user;
  UpdateUserAction(this.user);
}

User _delete(User user, DeleteUserAction deleteAction) {
  print("开始执行DeleteUserAction的逻辑：删除用户");
  deleteAction.user.name = "匿名";
  user = deleteAction.user;
  return user;
}

/// 定义了一个 action DeleteUserAction
class DeleteUserAction {
  User user;
  DeleteUserAction(this.user);
}

///// 中间件1
//class UserInfoMiddleware1 implements MiddlewareClass<ReduxState> {
//  @override
//  void call(Store<ReduxState> store, dynamic action, NextDispatcher next) async{
//    print("中间件 1 开始执行了");
//    if (action is AddUserAction) {
//      print("中间件拦截到 ------ 添加用户");
//      print("======== 执行 asyncMethod 异步方法 =========");
//       await asyncMethod().then((value){
//        print(value);
//      });
//    } else if (action is UpdateUserAction) {
//      print("中间件拦截到 ------ 更新用户");
//    }
//    print("中间件1 执行next方法，触发下一个中间件");
//    next(action);
//    print("该输出语句在 中间件1 的 next() 方法后面");
//  }
//
//  Future<String> asyncMethod() async{
//    print("模拟异步开始");
//    await Future.delayed(Duration(milliseconds: 3000));
//    print("模拟异步结束");
//    return "好了";
//  }
//}
//
///// 中间件2
//class UserInfoMiddleware2 implements MiddlewareClass<ReduxState> {
//  @override
//  void call(Store<ReduxState> store, dynamic action, NextDispatcher next) {
//    print("中间件 2 开始执行了");
//    if(action is DeleteUserAction) {
//      print("中间件拦截到 ------ 删除用户");
//    }
//    next(action);
//    print("该输出语句在 中间件2 的 next() 方法后面");
//  }
//}

/// 中间件1
class UserInfoMiddleware1 implements MiddlewareClass<ReduxState> {

  @override
  void call(Store<ReduxState> store, dynamic action, NextDispatcher next) {
    print("中间件 1 开始执行了");
    if (action is AddUserAction) {
      print("中间件拦截到 ------ 添加用户");
      print("========= 中间件拦截到\"添加用户\"后发起了 DeleteUserAction ==========");
      store.dispatch(DeleteUserAction(action.user));
    } else if (action is UpdateUserAction) {
      print("中间件拦截到 ------ 更新用户");
    }
    /// next看情况要不要执行
    /// 如果执行了，那后续的中间件和该action对应的逻辑都会执行
    /// 如果不执行，那就执行到这边就完了，后续的中间件和该action对应的逻辑都不会执行
    print("中间件1 执行next方法，触发下一个中间件");
    next(action);
    print("该输出语句在 中间件1 的 next() 方法后面");
  }
}

/// 中间件2
class UserInfoMiddleware2 implements MiddlewareClass<ReduxState> {

  @override
  void call(Store<ReduxState> store, dynamic action, NextDispatcher next) {
    print("中间件 2 开始执行了");
    if(action is DeleteUserAction) {
      print("中间件拦截到 ------ 删除用户");
    }
    next(action);
    print("该输出语句在 中间件2 的 next() 方法后面");
  }
}