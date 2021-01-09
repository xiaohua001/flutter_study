import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo')),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

//
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
      //  使用字体
      1、pubspec.yaml配置
      2、声明
      const myTextStyle = const TextStyle(
        fontFamily: 'Raleway',
      );
      3、使用textStyle
     */
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 18,
          color: Colors.red,
        ),
        child: Column(children: [
          Text('会议要求，要合理调配运力，配合各地倡导实施的非必要不旅行、错峰放假、避峰开学、景区限量预约接待等措施，引导错峰出行。',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              // overflow:TextOverflow.fade ,
              maxLines: 2,
              textScaleFactor: 1.8,
              style: TextStyle(
                  fontSize: 16.0,
                  inherit: false, //2.不继承默认样式
                  // color: Colors.red,
                  color: Color.fromRGBO(24, 23, 11, 0.9),
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.dashed,
                  letterSpacing: 5.0,wordSpacing: 4.0)
            ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home: "),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue)),
          ]))
        ]),
      ),
    );
  }
}
