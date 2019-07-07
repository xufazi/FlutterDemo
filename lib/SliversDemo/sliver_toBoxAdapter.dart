/**
 *  Create by fazi
 *  Date: 2019-07-06
 *
 *  SliverToBoxAdapter
 *  滚动列表中插入其他视图
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';
import 'package:flutter_demo/SliversDemo/item_view.dart';

class SliverToBoxAdapterPage extends StatefulWidget {

  @override
  State createState() => SliverToBoxAdapterPageState();
}

class SliverToBoxAdapterPageState extends State<SliverToBoxAdapterPage> {

  final List<ProductItem> defaultList = []
    ..addAll(products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SliverToBoxAdapterPage"),
        ),
      body:CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange,
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            children: defaultList.map((value){
              return ItemView.buildGridItem(context, value);
            }).toList(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
          ),
          SliverFixedExtentList(
              itemExtent: 150,
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                  return ItemView.buildListItem(context, defaultList[index]);
                },
                childCount: defaultList.length,
              )
          ),
//          SliverFillViewport(
//              delegate: SliverChildBuilderDelegate((context, index){
//                return _buildItem(index);
//              },childCount: defaultList.length),
//          )
        ],
      )
    );
  }
}
