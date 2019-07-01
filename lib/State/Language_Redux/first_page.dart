/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_demo/State/Language_Redux/redux_state.dart';
import 'package:flutter_demo/State/Language_Redux/locale_redux.dart';
import 'package:flutter_demo/State/Language_Redux/more_localization.dart';

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
                  children: <Widget>[
                    SizedBox(height: 50,),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(LocaleRefreshAction(Locale('zh','CH')));
                        },
                        child: Text('手动设置APP语言为：中文')
                    ),
                    SizedBox(height: 50,),
                    FlatButton(
                        onPressed: (){
                          store.dispatch(LocaleRefreshAction(Locale('en','US')));
                        },
                        child: Text('手动设置APP语言为：英文')
                    ),
                    SizedBox(height: 50,),
                    Text("MoreLocalization 当前语言：${MoreLocalization.of(context).currentLocalized.name}"),
                    SizedBox(height: 50,),
                    Text("Localizations 当前语言：${Localizations.localeOf(context)}"),
                    SizedBox(height: 50,),
                    Text("Store 当前语言：${store.state.locale.languageCode}"),
                  ],
                )
            ),
          );
        }
    );
  }
}


