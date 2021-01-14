import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io'; // 网络请求



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
    
   // var apiUrl="http://10.0.2.2:3000/userList"; // 模拟器默认把端口会映射成 10.0.2.2
    var httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(
                        Uri.parse("http://10.0.2.2:3000/userList"));
    var headers = Map<String, String>();
    headers['loginSource'] = 'IOS';
    request.headers.add("loginSource", "IOS");
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
      if (response.statusCode == HttpStatus.ok) {
      print('请求头：${response.headers}');

      print('请求成功代发数据为:\n $responseBody');
      print('--------------');
      Map data = jsonDecode(responseBody);
      print('请求成功代发数据为:\n $data');
       setState(() {
          this._list=data["result"];
      });
    } else {
      print('\n\n\n请求失败${response.statusCode}');
    }
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("client请求数据Demo"),
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