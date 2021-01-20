import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo22')),
      body: BothDirectionTestRoute(),
    ));
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() =>
      new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NotificationListener(
          onNotification: (notification) {
            switch (notification.runtimeType) {
              case ScrollStartNotification:
                print("开始滚动");
                break;
              case ScrollUpdateNotification:
                print("正在滚动");
                break;
              case ScrollEndNotification:
                print("滚动停止");
                break;
              case OverscrollNotification:
                print("滚动到边界");
                break;
            }
            return true;
          },
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
        )
      ],
    );
  }
}
