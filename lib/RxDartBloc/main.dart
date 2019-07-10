/**
 *  Create by fazi
 *  Date: 2019-07-09
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/RxDartBloc/one_page.dart';
import 'package:flutter_demo/RxDartBloc/two_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => OnePage(),
        "two": (_) => TwoPage()
      },
    );
  }
}