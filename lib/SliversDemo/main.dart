/**
 *  Create by fazi
 *  Date: 2019-07-05
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/route.dart';
import 'package:flutter_demo/SliversDemo/home_page.dart';
import 'package:flutter_demo/SliversDemo/sliver_appBar.dart';
import 'package:flutter_demo/SliversDemo/sliver_list.dart';
import 'package:flutter_demo/SliversDemo/sliver_grid.dart';
import 'package:flutter_demo/SliversDemo/sliver_persistentHeader.dart';
import 'package:flutter_demo/SliversDemo/sliver_toBoxAdapter.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      routes: {
        UIRoute.home: (context) => HomePage(),
        UIRoute.sliverAppBar: (_) => SliverAppBarPage(),
        UIRoute.sliverList: (_) => SliverListPage(),
        UIRoute.sliverGirdPage: (_) => SliverGirdPage(),
        UIRoute.sliverPersistentHeader: (_) => SliverPersistentHeaderPage(),
        UIRoute.sliverToBoxAdapter: (_) => SliverToBoxAdapterPage(),
      },
    );
  }
}


