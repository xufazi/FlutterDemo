/**
 *  Create by fazi
 *  Date: 2019-07-05
 *
 *  SliverAppBar 实现AppBar显示或隐藏的功能
 *
 *  floating：控制是不是需要滑到顶部才触发效果
 *  snap：触发的效果是自动的还是需要手动的
 *  pinned：true肯定显示，false肯定不显示
 *
 *  1、floating：true、snap：true、pinned：false
 *  只要下拉，头部视图就开始显示，接着自动全部显示，不管列表有没有到顶部
 *  只要上移，头部视图就开始隐藏，接着自动全部隐藏
 *
 *  2、floating：true、snap：false、pinned：false
 *  只要下拉，头部视图就开始显示，根据下拉偏离量显示，不管列表有没有到顶部
 *  只要上移，头部视图就开始隐藏，根据下拉偏离量隐藏，
 *
 *  3、floating：false、snap：false、pinned：false
 *  头部视图的显示和隐藏只有列表到了顶部才会触发
 *
 *  4、pinned：true，显示，不管floating和snap是何值
 *
 *  下面情况不存在
 *  floating：false
 *  snap：true
 *
 *
 *  SliverFixedExtentList
 *  循环列表，item的高统一
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';
import 'package:flutter_demo/SliversDemo/item_view.dart';

class SliverAppBarPage extends StatefulWidget {

  @override
  State createState() => SliverAppBarPageState();
}

class SliverAppBarPageState extends State<SliverAppBarPage> {

  bool floating = false;
  bool snap = false;
  bool pinned = false;

  final double defaultHeight = 200;

  double offset = 0;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    /// 这边监听主要是做头部视图的缩放效果
    scrollController.addListener((){
      double off = scrollController.offset;
      if(off < 0 && off > -(defaultHeight)) {
        setState(() {
          offset = -off;
        });
      }
    });
  }

  final List<ProductItem> defaultList = []
    ..addAll(products)
    ..addAll(products)
    ..addAll(products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              FlatButton(onPressed: (){}, child: Icon(Icons.add)),
              Container(color: Colors.orange, width: 30,),
              SizedBox(width: 10,),
              Container(color: Colors.red, width: 30,)
            ],
            title: Text("SliverAppBar"),
            centerTitle: true,
            /// 这边有个 offset 来做下拉的时候头部视图的缩放
            expandedHeight: defaultHeight + offset,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(image: AssetImage('images/image1.png'), fit: BoxFit.cover,),
            ),
            floating: floating,
            snap: snap,
            pinned: pinned,
          ),
          SliverFixedExtentList(
            itemExtent: 150,
            delegate: SliverChildBuilderDelegate(
              (context, index){
                return ItemView.buildListItem(context, defaultList[index]);
              },
              childCount: defaultList.length,
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(child: Text('rest'), value: 0,),
              const PopupMenuItem(child: Text('floating = true , snap = true'), value: 1,),
              const PopupMenuItem(child: Text('floating = true , snap = false'), value: 2,),
              const PopupMenuItem(child: Text('floating = false , snap = false'), value: 3,),
              const PopupMenuItem(child: Text('pinned = true'), value: 4,),
            ],
          onSelected: (value){
            switch(value) {
              case 0:
                setState(() {
                  floating = false;
                  snap = false;
                  pinned = false;
                });
                break;
              case 1:
                setState(() {
                  floating = true;
                  snap = true;
                  pinned = false;
                });
                break;
              case 2:
                setState(() {
                  floating = true;
                  snap = false;
                  pinned = false;
                });
                break;
              case 3:
                setState(() {
                  floating = false;
                  snap = false;
                  pinned = false;
                });
                break;
              case 4:
                setState(() {
                  floating = false;
                  snap = false;
                  pinned = true;
                });
                break;
            }
          },
          offset: Offset(-50, -220),
        ),
      ),
    );
  }
}



