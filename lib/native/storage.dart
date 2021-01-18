


import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: StoragePage(),
    );
  }
}

class StoragePage extends StatefulWidget {
  StoragePage({Key key}) : super(key: key);

  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {

  _saveData() async{
      SharedPreferences sp=await SharedPreferences.getInstance();

      sp.setString("username", "张三111");

       sp.setString("age", "26");


      // 存储不同类型
      // sp.setString(key, value);
      // sp.setBool(key, value);
      // sp.setDouble(key, value);
      // sp.setInt(key, value);
      // sp.setStringList(key, value);
            
  }
  _getData() async{
      SharedPreferences sp=await SharedPreferences.getInstance();

      print(sp.getString("username"));

      print(sp.getString("age"));
  }
  _removeData() async{
     SharedPreferences sp=await SharedPreferences.getInstance();

      print(sp.remove("age"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地存储"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            child: Text('保存数据'),
            onPressed: _saveData,
          ),
          SizedBox(height: 10),
          RaisedButton(
            child: Text('获取数据'),
            onPressed:_getData,
          ),
           SizedBox(height: 10),
          RaisedButton(
            child: Text('清除数据'),
            onPressed:_removeData,
          )         
        ]),
      ),
    );
  }
}
