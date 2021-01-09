import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
       // fit: StackFit.expand,    // 如果注释掉 那么 第三个child 会被遮住，因为未定位的第二个widget占满Stack整个空间
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        //alignment:Alignment(1,0.3), // 也可以以坐标轴的方式定位
        children: <Widget>[
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          ),
          Container(
            // alignment: Alignment(0,-0.2),// 自己也可以设置定位，是相对于父级
            child: Text("Hello world", style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
        ],
      ),
    ));
  }
}
