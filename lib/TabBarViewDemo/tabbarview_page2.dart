/*
*
**/

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {

  static final String sName = "page2";

  @override
  State createState() => _Page2State();
}

class _Page2State extends State<Page2> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print("Page 2 init");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text("Page 2");
  }

  @override
  bool get wantKeepAlive => true;

}