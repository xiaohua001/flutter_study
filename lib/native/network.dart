import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';

import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetWorkPage()
    );
  }
}

class NetWorkPage extends StatefulWidget {
  @override
  _NetWorkPageState createState() => _NetWorkPageState();
}

class _NetWorkPageState extends State<NetWorkPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('首页'),
      ),
      body: Container(
        child: RaisedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PageDemo()));
        }),
      ),
    );
  }
}
class PageDemo extends StatefulWidget {
  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  StreamSubscription<ConnectivityResult> subscription;
  String nowNetWork='';
  @override
  initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
        setState(() {
          this.nowNetWork='当前处于移动网络';
        });
      } else if (result == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        setState(() {
          this.nowNetWork='当前处于wifi';
        });
        
      }else{
        setState(() {
          this.nowNetWork='网络无连接';
        });
        
      }
    });
  }
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络检测页面'),),
      body: Center(
        child: Text(nowNetWork),
      ),
    );
  }
}
