import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '测试',
        home: Scaffold(
          appBar: AppBar(
            title: Text('标题'),
          ),
          body: LCBMyBody(),
        ));
  }
}

class LCBMyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHome();
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
   final registerFormKey=GlobalKey<FormState>();
  String username,password;
  void register(){
    FormState formState = registerFormKey.currentState;
    if(formState.validate()){
       formState.save();
       print("username:$username password:$password");
    }
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key:registerFormKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
              InputDecoration(icon: Icon(Icons.people), labelText: '用户名'),
              onSaved: (value){
                print("用户名：$value");
                this.username=value;

              },
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration:
              InputDecoration(icon: Icon(Icons.people), labelText: '密码'),
              onSaved: (value){
                this.password=value;
              },
              validator: (value){
                return value.length<4?"密码长度不够4位":null;
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text('注册'),
                onPressed: () {
                  register();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
