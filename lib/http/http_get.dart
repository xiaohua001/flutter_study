import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



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

  List _list=[];

  @override
  void initState() {
    super.initState();
    this._getData();
  }
  _getData() async{
    // var apiUrl="http://lcb.com/api/userList";
        // var apiUrl="http://127.0.0.1:3000/userList";  //肯定会报错
        // var apiUrl ="http://192.168.0.109:3000/userList" //模拟器不在同一网段的时候也会报错
    var apiUrl="http://10.0.2.2:3000/userList"; // 模拟器默认把端口会映射成 10.0.2.2
    var result=await http.get(apiUrl);
       print(result.body);
    if(result.statusCode==200){
      print(result.body);
      setState(() {
       this._list=json.decode(result.body)["result"];
      });
    }else{
      print("失败${result.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请求数据Demo"),
      ),
      body: this._list.length>0?ListView.builder(
        itemCount:this._list.length ,
        itemBuilder: (context,index){
            return ListTile(
              title: Text("${this._list[index]["name"]}------${this._list[index]["age"]}"),
            );  
        },
      ):
      Text("加载中...")
    );
  }
}