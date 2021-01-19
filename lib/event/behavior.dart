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
  // ignore: unused_field
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
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300.0, 150.0)),
          child: Center(child: Text("Box A")),
        ),
        behavior: HitTestBehavior.opaque,
        onPointerDown: (PointerDownEvent event) {
          _event = event;
          print('down A');
        },
      )

      
      // body: Stack(
      //   children: <Widget>[
      //     Listener(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints.tight(Size(300.0, 200.0)),
      //         child:
      //             DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
      //       ),
      //       onPointerDown: (event) => print("down0"),
      //     ),
      //     Listener(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints.tight(Size(200.0, 100.0)),
      //         child: Center(child: Text("左上角200*100范围内非文本区域点击")),
      //       ),
      //       onPointerDown: (event) => print("down1"),
      //       //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
      //     )
      //   ],
      // ),
    );
  }
}
