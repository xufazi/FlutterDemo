/**
 *  Create by fazi
 *  Date: 2019-06-10
 */

import "package:flutter/material.dart";
import 'package:flutter_demo/State/Language_NoRedux/more_localization.dart';

class FirstPage extends StatefulWidget {

  static final String sName = "/";

  @override
  State createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("ReduxDemo3"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Text("MoreLocalization 当前内容：${MoreLocalization.of(context).currentLocalized.name}"),
              SizedBox(height: 50,),
              /// 获取系统当前语言
              Text("Localizations 当前语言：${Localizations.localeOf(context)}"),
              SizedBox(height: 50,),

            ],
          )
      ),
    );
  }
}


