/**
 *  Create by fazi
 *  Date: 2019-07-05
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/route.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            child: AppBar(
              title: Text("Home"),
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width , kToolbarHeight)
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _rendItem(context, index);
          },
          itemCount: _menus.length,
        ),
      ),
    );
  }

  _rendItem(context, index) {
    ItemData data = _menus[index];
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, data.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(data.title, style: Theme.of(context).textTheme.subhead,),
          ),
        ),
      ),
    );
  }
}

class ItemData {

  final String title;
  final String routeName;

  ItemData(this.title,  this.routeName);

}

final List<ItemData> _menus = [
  ItemData("SliverAppBarPage",UIRoute.sliverAppBar),
  ItemData("SliverListPage", UIRoute.sliverList),
  ItemData("SliverGirdPage", UIRoute.sliverGirdPage),
  ItemData("SliverPersistentHeader", UIRoute.sliverPersistentHeader),
  ItemData("SliverToBoxAdapterPage", UIRoute.sliverToBoxAdapter)
];