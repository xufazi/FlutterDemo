/**
 *  Create by fazi
 *  Date: 2019-07-05
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';
import 'package:flutter_demo/SliversDemo/item_view.dart';

class SliverGirdPage extends StatefulWidget {

  @override
  State createState() => SliverGirdPageState();
}

class SliverGirdPageState extends State<SliverGirdPage> {

  final List<ProductItem> defaultList = []
    ..addAll(products)
    ..addAll(products)
    ..addAll(products);

  @override
  Widget build(BuildContext context) {

    defaultList.map((value){
      if (value.name.length > 14) {
        return value;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("SliverGirdPage"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index){
                return ItemView.buildGridItem(context, defaultList[index]);
              }, childCount: defaultList.length),
              /// The delegate that controls the size and position of the children.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3
              ),
          ),
          SliverGrid.count(
            /// 指定了一行展示多少个item
              crossAxisCount: 2,
            children: defaultList.map((value){
              return ItemView.buildGridItem(context, value);
            }).toList(),
          ),
          SliverGrid.extent(
            /// 指定item的最大宽度，Flutter自己决定一行展示多少个item
              maxCrossAxisExtent: 200,
            children: defaultList.map((value){
              return ItemView.buildGridItem(context, value);
            }).toList(),
          )
        ],
      ),
    );
  }


}
