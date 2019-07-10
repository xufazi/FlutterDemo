/*
*
**/

import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {

  static final String sName = "/";

  @override
  State createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print("Page 1 init");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text("Page 1");
  }

  @override
  bool get wantKeepAlive => true;

}