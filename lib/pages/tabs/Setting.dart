import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("当前演示一下替换路由和返回根路由"),
        ),
         ListTile(
          title: Text("测试"),
        ),
         ListTile(
          title: Text("测试"),
        ),
         ListTile(
          title: Text("测试4"),
        ),
                
        RaisedButton(
          child: Text("跳转到登录页面"),
          onPressed: (){
              Navigator.pushNamed(context, '/login');
          },
        ),
        RaisedButton(
          child: Text("跳转到注册页面"),
          onPressed: (){
             Navigator.pushNamed(context, '/registerFirst');
          },
        ),
      ],
    );
  }
}