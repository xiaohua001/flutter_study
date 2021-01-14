
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpDemo(),
    );
  }
}

class HttpDemo extends StatefulWidget {
  HttpDemo({Key key}) : super(key: key);

  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  _getData() async {

    try {
    var apiUrl="http://10.0.2.2:3000/userList";
    Response result=await Dio().get(apiUrl);
      print(result);
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Dio Demo"),
        ),
        body: this._list.length > 0
            ? ListView(
                children: this._list.map((value) {
                  return ListTile(
                    title: Text(value["name"]),
                  );
                }).toList(),
              )
            : Text("加载中..."));
  }
}
