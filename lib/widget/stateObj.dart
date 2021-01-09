import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
          title: Text("子树中获取State对象"),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return RaisedButton(
              onPressed: () {
                // 查找父级最近的Scaffold对应的ScaffoldState对象
                ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
               // 如果StatefulWidget的状态是希望暴露出的，应当在StatefulWidget中提供一个of静态方法来获取其State对象
               //  ScaffoldState _state=Scaffold.of(context); 

                //调用ScaffoldState的showSnackBar来弹出SnackBar
                _state.showSnackBar(
                  SnackBar(
                    content: Text("我是SnackBa2r"),
                  ),
                );
              },
              child: Text("显示SnackBar"),
            );
          }),
        ),
      );
  }
}
