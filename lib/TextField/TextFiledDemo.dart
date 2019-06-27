/**
 *  Create by fazi
 *  Date: 2019-06-18
 */

import 'package:flutter/material.dart';

main() => runApp(MaterialApp(home: TextFiledDemo(),));

class TextFiledDemo extends StatefulWidget {

  @override
  State createState() => TextFiledDemoStatus();
}

class TextFiledDemoStatus extends State<TextFiledDemo> {

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  bool choosed = false;  //false：文本框1焦点  true：文本框2焦点

  @override
  void initState() {
    textEditingController.addListener((){
      print("控制器的addListener，"
          "\ntextEditingController.value查看输出的全部信息，"
          "\n信息为${textEditingController.value}"
          "\n实时输出文本框具体信息为：${textEditingController.value.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///deferToChild会将事件在widget tree中向下传递；
      ///opaque防止background widgets收到事件；
      ///translucent则允许background widgets收到事件；
      behavior: HitTestBehavior.translucent,
      onTap: (){
        /// 通过GestureDetector捕获点击事件，再通过FocusScope将焦点转移至空焦点FocusNode()
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('TextFiledDemo'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// InputDecoration.collapsed   这个是将默认样式里的边框给去掉
                _buildTitle('监听'),
                TextField(
                  onSubmitted: (value){
                    print("onSubmitted 点击了键盘的确定按钮，输出的信息是：${value}");

                    /// 取消键盘当前焦点，键盘隐藏
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  onEditingComplete: (){
                    print("onEditingComplete 点击了键盘的确定按钮");
                  },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                  },
                  decoration: InputDecoration(
                      hintText: "这是实现自己的 onChanged 的监听",
                  ),
                ),
                TextField(
                  controller: textEditingController,
                  onSubmitted: (value){
                    print("onSubmitted 点击了键盘的确定按钮，输出的信息是：${value}");
                  },
                  onEditingComplete: (){
                    print("onEditingComplete 点击了键盘的确定按钮");
                  },
                  decoration: InputDecoration(
                      hintText: "这是关联 controller 的实时监听"
                  ),
                ),


                _buildTitle('边框，装饰器InputDecoration'),
                TextField(
                  decoration: InputDecoration(
                    hintText: " InputDecoration 有边框",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: " InputDecoration.collapsed 无边框",
                  ),
                ),


                _buildTitle('焦点切换'),
                TextField(
                  focusNode: focusNode1,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "autofocus 设置 true 则当前文本获得焦点",
                  ),
                ),
                TextField(
                  focusNode: focusNode2,
                  decoration: InputDecoration(
                    hintText: "autofocus默认是false",
                  ),
                ),
                RaisedButton(
                  child: Text("切换焦点，FocusScope.of(context).requestFocus()"),
                    onPressed: (){
                      choosed = !choosed;
                      FocusScope.of(context).requestFocus(choosed ? focusNode2 : focusNode1);
                    }
                ),


                _buildTitle('对齐，textAlign'),
                TextField(
                  decoration: InputDecoration(
                    hintText: "TextAlign.center ",
                  ),
                  textAlign: TextAlign.center,
                ),


                _buildTitle('TextView'),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "这是一个TextView，通过设置maxLines来实现，再把装饰器改成 InputDecoration.collapsed 就行",
                  ),
                ),


                _buildTitle('隐藏文本 obscureText'),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "obscureText 设置 true",
                  ),
                ),


                _buildTitle("水印 hintText、labelText、helperText"),
                TextField(
                  decoration: InputDecoration(
                      hintText: "hintText",
                      hintStyle: TextStyle(color: Colors.red)
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "labelText，文本框聚焦的时候整个文案会上移",
                      labelStyle: TextStyle(color: Colors.orange)
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      helperText: "helperText，帮助文案，在文本框下面",
                      helperStyle: TextStyle(color: Colors.green)
                  ),
                ),


                _buildTitle("图标，但是装饰器只能用InputDecoration，不能使用InputDecoration.collapsed"),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: "icon",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: "prefixIcon",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.phone),
                    hintText: "suffixIcon",
                  ),
                ),


                _buildTitle('键盘类型'),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "键盘类型：TextInputType",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "键盘左下角键：textInputAction",
                  ),
                  textInputAction: TextInputAction.go,
                ),


                _buildTitle('光标样式'),
                TextField(
                  cursorColor: Colors.yellow,
                  cursorWidth: 20,
                  cursorRadius: Radius.circular(5),
                ),


                _buildTitle("边框border"),
                TextField(
                  decoration: InputDecoration(
                    hintText: "InputBorder.none",
                    border: InputBorder.none
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    hintText: "UnderlineInputBorder()"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "OutlineInputBorder()"
                  ),
                ),


                _buildTitle('文本大写，textCapitalization'),
                TextField(
                  decoration: InputDecoration(
                    hintText: "TextCapitalization.characters 全大写",
                  ),
                  textCapitalization: TextCapitalization.characters,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "TextCapitalization.words 单词首字母大写",
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "TextCapitalization.words 句子首字母大写，.点区分",
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(title) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

