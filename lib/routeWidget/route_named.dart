import 'package:flutter/material.dart';
// 这里所有的命名路由都在同一个页面 结构相对不清晰
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute:"/", //名为"/"的路由作为应用的home(首页)
      routes: {
         "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由 

       
        "new_page": (context) => NewRoute(),
        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);   // TipRoute有 参数接收的时候
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '测试命名导航:',
            ),
   
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () async {
                //命名导航到新路由不带参数
                //   Navigator.pushNamed(context, "new_page");

                //命名导航到新路由带参数
                // Navigator.of(context).pushNamed("new_page", arguments: "hi");
                 Navigator.of(context).pushNamed("tip2", arguments: "hello");
              },
            ),
          ],
        ),
      )
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 命名路由接收一个参数
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route" + args),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
