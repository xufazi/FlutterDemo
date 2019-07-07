/**
 *  Create by fazi
 *  Date: 2019-07-07
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';

class ItemView {

  /// 高度一定的list
  static Widget buildListItem (BuildContext context, ProductItem product) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: Container(
              width: 70.0,
              height: 70.0,
              child: Image.asset(product.asset, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(product.name, style: Theme.of(context).textTheme.subhead),
              )
          )
        ],
      ),
    );
  }

  /// 高度变化的list
  static Widget buildListVaryItem (BuildContext context, ProductItem product) {
    String content = product.name;
    if(content == "Time and tide wait for no man.") {
      for(int i = 0; i < 15; i++) {
        content = product.name+content;
      }
    }
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Container(
              width: 40.0,
              height: 40.0,
              child: Image.asset(product.asset, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                    content,
                    style: Theme.of(context).textTheme.subhead
                ),
              )
          )
        ],
      ),
    );
  }

  /// 创建 垂直的 Drid
  static Widget buildGridItem (BuildContext context, ProductItem product) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            child: Container(
              width: 70.0,
              height: 70.0,
              child: Image.asset(product.asset, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(product.name, style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }

  /// 创建 水平的 Drid
  static Widget buildGridItemRow (BuildContext context, ProductItem product) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: Container(
              width: 70.0,
              height: 70.0,
              child: Image.asset(product.asset, fit: BoxFit.cover,),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(product.name, style: Theme.of(context).textTheme.subhead),
              )
          )
        ],
      ),
    );
  }

}
