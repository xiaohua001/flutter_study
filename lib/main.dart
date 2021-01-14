
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
                  //  this._list=[{"name":'xxx',"age":12},{"name":'xxx1',"age":23}];

  }

  _getData() async {

    try {
      var apiUrl="http://0.0.0.0:3000/userList"; // mac 网络环境
      // var apiUrl="http://10.0.2.2:3000/userList"; // win 
       // var apiUrl="http://192.168.1.192:3000/userList"; 
    Response result=await Dio().get(apiUrl);
      setState(() {
        this._list = result.data['result'];
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: Text("dio请求数据Demo"),
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
