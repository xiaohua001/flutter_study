import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '事件处理与通知 Demo',
      home: WxPay(),
    );
  }
}

class WxPay extends StatefulWidget {
  WxPay({Key key}) : super(key: key);

  _WxPayState createState() => _WxPayState();
}

class _WxPayState extends State<WxPay> {
  PointerEvent _event;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listener监听"),
        ),
        body: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 500.0,
            child: Text(_event?.toString() ?? "",
                style: TextStyle(color: Colors.white)),
          ),
          onPointerDown: (PointerDownEvent event) =>
              setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) =>
              setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        ));
  }
}
