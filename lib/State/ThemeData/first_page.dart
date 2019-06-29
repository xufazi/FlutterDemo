/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/State/ThemeData/redux_state.dart';
import 'package:flutter_demo/State/ThemeData/theme_redux.dart';

class FirstPage extends StatefulWidget {

  static final String sName = "/";

  @override
  State createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    return StoreBuilder<ReduxState>(
        builder: (BuildContext context, Store<ReduxState> store){
          return Scaffold(
            appBar: AppBar(
              title: Text("ReduxDemo3"),
            ),
            body: Center(
                child: Column(
                  children: _btnList(store),
                )
            ),
          );
        }
    );
  }

  _btnList(Store store) {
    List<Widget> list = List();
    for(int i = 0; i < getThemeListColors().length; i++) {
      list.add(SizedBox(height: 20,));
      list.add(_buildBtns(store, i));
    }
    return list;
  }

  Widget _buildBtns(Store store, int index) {
    return FlatButton(
        onPressed: (){
          store.dispatch(ThemeRefreshAction(ThemeData(
            primaryColor: getThemeListColors()[index]
          )));
        },
        child: Text(
         getThemeListNames()[index],
          style: TextStyle(
            color: store.state.themeData.primaryColor
          ),
        )
    );
  }

  static List<Color> getThemeListColors() {
    return [
      Colors.black,
      Colors.red,
      Colors.orange,
      Colors.brown,
      Colors.blue,
    ];
  }

  static List<String> getThemeListNames() {
    return [
      "black",
      "red",
      "orange",
      "brown",
      "blue",
    ];
  }
}


