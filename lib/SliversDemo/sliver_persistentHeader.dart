/**
 *  Create by fazi
 *  Date: 2019-07-06
 *
 *  1、floating：false、pinned：false
 *  头部不固定，跟随列表滑动
 *
 *  2、floating：true、pinned：true
 *  第一组的头部会固定，其余不会，该情况不考虑
 *
 *  3、floating：true、pinned：false
 *  头部不固定，跟随列表滑动，但是只要下滑，第一组的头部就会显示
 *
 *  4、floating：false、pinned：true
 *  头部固定，叠在顶部
 *
 *
 *  SliverPersistentHeaderDelegate
 *  minExtent：最小高度
 *  maxHeight：最大高度
 *  2个值不同的时候，会有个展开和收起的效果
 *  2个值一样的时候，不会有展开和收起的效果
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/SliversDemo/product_list.dart';
import 'package:flutter_demo/SliversDemo/item_view.dart';
import 'dart:math' as math;
import 'dart:ui';

class SliverPersistentHeaderPage extends StatefulWidget {

  @override
  State createState() => SliverPersistentHeaderPageState();
}

class SliverPersistentHeaderPageState extends State<SliverPersistentHeaderPage> {

  bool floating = false;
  bool pinned = true;

  final List<ProductItem> defaultList = []
    ..addAll(products)
    ..addAll(products)
    ..addAll(products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverPersistentHeaderPage"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildHeader(0),
          SliverGrid.count(
              crossAxisCount: 3,
            children: defaultList.map((value){
              return ItemView.buildGridItem(context, value);
            }).toList(),
          ),
          _buildHeader(1),
          SliverFixedExtentList(
              itemExtent: 150,
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                   return ItemView.buildListItem(context, defaultList[index]);
                },
                childCount: defaultList.length,
              )
          ),
          _buildHeader(2),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index){
                return ItemView.buildGridItemRow(context, defaultList[index]);
              }, childCount: defaultList.length),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 3.0,
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(child: Text('floating = false , pinned = false'), value: 0,),
            const PopupMenuItem(child: Text('floating = true , pinned = true'), value: 1,),
            const PopupMenuItem(child: Text('floating = true , pinned = false'), value: 2,),
            const PopupMenuItem(child: Text('floating = false , pinned = true'), value: 3,),
          ],
          onSelected: (value){
            switch(value) {
              case 0:
                setState(() {
                  floating = false;
                  pinned = false;
                });
                break;
              case 1:
                setState(() {
                  floating = true;
                  pinned = true;
                });
                break;
              case 2:
                setState(() {
                  floating = true;
                  pinned = false;
                });
                break;
              case 3:
                setState(() {
                  floating = false;
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

  SliverPersistentHeader _buildHeader(int index) {
    String asset = titleAssets[index];
    return SliverPersistentHeader(
      pinned: pinned,
        floating: floating,
        delegate: _SliverHeaderDelegate(
            minHeight: 60,
            maxHeight: 120,
            child: Container(
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.plus,
                    image: DecorationImage(
                      image: AssetImage(asset),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.white
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      height: 60.0,
                      child: Center(
                        child: Text(
                          'This is header ${index + 1}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xE5FFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            )
        )
    );
  }



}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;
}

final List<String> titleAssets = [
  'images/image1.png',
  'images/image2.png',
  'images/image3.png',
];

