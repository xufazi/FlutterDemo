/**
 *  Create by fazi
 *  Date: 2019-07-09
 */

import 'package:flutter/material.dart';
import 'package:flutter_demo/RxDartBloc/User.dart';
import 'package:flutter_demo/RxDartBloc/main_bloc.dart';

class OnePage extends StatelessWidget {

  final MainBloc mainBloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnePage"),
      ),
      body: StreamBuilder(
        stream: mainBloc.stream,
        initialData: mainBloc.user,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text(snapshot.data.name),
                  Text(snapshot.data.address),
                  SizedBox(height: 20,),
                  FlatButton(
                      onPressed: (){
                        mainBloc.change();
                      },
                      child: Text("改变值")
                  ),
                  SizedBox(height: 20,),
                  FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "two");
                      },
                      child: Text("下一页")
                  )
                ],
              ),
            );
        }
      ),
    );
  }
}