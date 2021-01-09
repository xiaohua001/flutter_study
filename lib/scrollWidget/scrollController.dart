import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo2')),
       body: ScrollControllerTestRoute(),
    ));
  }
}


class ScrollControllerTestRoute extends StatefulWidget {
  @override
  // _ScrollControllerTestRouteState createState() {
  //   return new _ScrollControllerTestRouteState();
  // }
    _ScrollControllerTestRouteState createState() => new _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
     // print(_controller.offset); //打印滚动位置
    //  print(_controller.position.maxScrollExtent); //打印最大位置
      setState(() {
           double progress = _controller.offset / _controller.position.maxScrollExtent;           
         _progress = "${(progress * 100).toInt()}%";
        });
     
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制"+this._progress)),
      body: Scrollbar(
        // 一种是 通过controller 来获取位置信息 另一种是通过滚动监听来获取
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      //   child: NotificationListener<ScrollNotification>(
      //   onNotification: (ScrollNotification notification) {
      //     double progress = notification.metrics.pixels /
      //         notification.metrics.maxScrollExtent;
      //     //重新构建
      //     setState(() {
      //       _progress = "${(progress * 100).toInt()}%";
      //     });
      //     print("BottomEdge: ${notification.metrics.extentAfter == 0}");
      //     return true; //放开此行注释后，进度条将失效
      //   },
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: <Widget>[
      //       ListView.builder(
      //           itemCount: 100,
      //           itemExtent: 50.0,
      //           itemBuilder: (context, index) {
      //             return ListTile(title: Text("$index"));
      //           }
      //       ),
      //       CircleAvatar(  //显示进度百分比
      //         radius: 30.0,
      //         child: Text(_progress),
      //         backgroundColor: Colors.black54,
      //       )
      //     ],
      //   ),
      // ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部 前者无动画 后者有动画
            _controller.jumpTo(.0,
              
            );
            //  _controller.animateTo(.0,
            //     duration: Duration(milliseconds: 200),
            //     curve: Curves.ease
            // );
          }
      ),
      
    );
  }
}



