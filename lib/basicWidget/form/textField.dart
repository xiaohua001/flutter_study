import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TextFieldTestRoute());
  }
}

class TextFieldTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<TextFieldTestRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Form Test"),
      ),
      body: FocusTestRoute()
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {

  TextEditingController _usernameController = new TextEditingController();
    var _password;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          
          TextField(
            autofocus: true, 
            decoration: InputDecoration(
                 labelText: "用户名"
            ),
            controller: _usernameController
          ),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "密码"
              ),             
              onChanged: (value){
                 setState(() {
                    this._password=value; 
                 });
              },
              keyboardType:TextInputType.number
              
            ),
            TextField(
              maxLines: 4,
              decoration:InputDecoration(
                hintText:"多行文本框",
                border: OutlineInputBorder()
              ) ,
            ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("获取输入框的内容"),
                  onPressed: () {
                    print(_usernameController.text);
                    print(this._password);
                  },
                ),
              ],
            );
          },
          ),
        ],
      ),
    );
  }

}