/*
*
**/

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {

  static final String sName = "page3";

  @override
  State createState() => _Page3State();
}

class _Page3State extends State<Page3> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print("Page 3 init");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text("Page 3");
  }

  @override
  bool get wantKeepAlive => true;

}