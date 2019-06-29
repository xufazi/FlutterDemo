/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/State/ThemeData/redux_state.dart';
import 'package:flutter_demo/State/ThemeData/first_page.dart';

main() {
  /// 创建全局Store
  final store = Store<ReduxState>(
      getReduce,
      initialState: ReduxState(
        themeData: ThemeData(primaryColor: Colors.black)
      )
  );
  runApp(ReduxDemo3(store,));
}

class ReduxDemo3 extends StatelessWidget {

  final Store<ReduxState> store;
  ReduxDemo3(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        /// StoreBuilder后要跟上我们定义的那个State类，要不会报错，
        child: StoreBuilder<ReduxState>(builder: (BuildContext context, Store<ReduxState> store){
          return MaterialApp(
            title: 'ReduxDemo3',
            theme: store.state.themeData,
            home: FirstPage(),
          );
        })
    );
  }
}
