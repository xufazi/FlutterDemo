/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/State/Middleware/redux_state.dart';
import 'package:flutter_demo/State/Middleware/user_reducer.dart';

class NextPage extends StatefulWidget {

  @override
  State createState() => NextPageState();
}

class NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {

    /// StoreBuilder
    return StoreBuilder<ReduxState>(
        builder: (BuildContext context, Store<ReduxState> store){
          return Scaffold(
            appBar: AppBar(
              title: Text("这是第二页"),
            ),
            body: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text(store.state.user.name),
                    SizedBox(height: 50,),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(AddUserAction(store.state.user));
                        },
                        child: Text("添加用户")
                    ),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(UpdateUserAction(store.state.user));
                        },
                        child: Text("更新用户")
                    ),
                  ],
                )
            ),
          );
        }
    );

    /// StoreConnector
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("这是第二页"),
//      ),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            StoreConnector<ReduxState, String>(
//              converter: (store) => store.state.name,
//                builder: (BuildContext context, String name) {
//                  return Text(name);
//                },
//            ),
//            SizedBox(height: 100,),
//            StoreBuilder<ReduxState>(
//                builder: (context, store) {
//                  return FlatButton(
//                      onPressed: (){
//                        store.dispatch(Action.Change);
//                      },
//                      child: Text("点击变换数据")
//                  );
//                }
//            ),
//          ],
//        )
//      ),
//    );
  }

}
