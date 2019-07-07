/**
 *  Create by fazi
 *  Date: 2019-07-05
 *
 *  SliverList
 *  循环列表，item的高由内容决定
 *
 *  delegate可以使用 SliverChildBuilderDelegate 或者 SliverChildListDelegate
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';
import 'package:flutter_demo/SliversDemo/item_view.dart';

class SliverListPage extends StatefulWidget {

  @override
  State createState() => SliverListPageState();
}

class SliverListPageState extends State<SliverListPage> {

  final List<ProductItem> defaultList = []
    ..addAll(products)
    ..addAll(products)
    ..addAll(products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverList"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(

//              delegate: SliverChildBuilderDelegate(
//                    (context, index){
//                  return ItemView.buildListItem(context, defaultList[index]);
//                },
//                childCount: products.length,
//              )

            delegate: SliverChildListDelegate(defaultList.map((value){
              return ItemView.buildListVaryItem(context, value);
            }).toList()),

          )
        ],
      ),
    );
  }


}
