import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 根组件.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
       child:Icon(Icons.accessible,color: Colors.green,size: 50.0),
       
        // 3、使用
        //child:Icon(MyIcons.wechat,color: Colors.green,size: 50.0),
      height: 400,
      width: 300,
      
 
    ));
  }
}
// 自定义图标使用
/* 
1、导入字体图标文件,路径假设 fonts/iconfont.ttf：
配置yaml：
    fonts:
      - family: myIcon  #指定一个字体名
        fonts:
          - asset: fonts/iconfont.ttf
 */
// 2、定义
class MyIcons{
  // 微信图标
  static const IconData wechat = const IconData(
      0xec7d,  
      fontFamily: 'myIcon', 
      matchTextDirection: true
  );
}
