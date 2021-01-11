import 'package:flutter/material.dart';
import 'package:flutter170/routes/Routes.dart';



// import 'routes/Routes.dart';




void main() => runApp(MyApp());
class MyApp extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/appBarDemo',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute
    );
  }
}
