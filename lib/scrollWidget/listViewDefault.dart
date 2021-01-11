import 'package:flutter/material.dart';

/* 
  普通的默认构造函数接受一个widget列表，适用于子组件数量较少的情况，这些都是提前创建的，没有基于Sliver懒加载

 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      // child: ListView2(), // contanier
      child: ListView3(), // ListTile
    );
  }
}

class ListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // 公共参数
      scrollDirection: Axis.horizontal,

      // bool reverse = false,
      // ScrollController controller,
      // bool primary,
      // ScrollPhysics physics,
      // EdgeInsetsGeometry padding,
      // double itemExtent,
      // bool shrinkWrap = false,
      // bool addAutomaticKeepAlives = true,
      // bool addRepaintBoundaries = true,
      // double cacheExtent,

      // 子widget列表
      children: <Widget>[
        Container(
          width: 100.0,
          color: Colors.red,
        ),
        Container(
          width: 100.0,
          color: Colors.orange,
          child: ListView(
            children: <Widget>[
              Image.network("https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),
              Text('我是一个文本2')
            ],
          ),
        ),
        Container(
          width: 100.0,
          color: Colors.blue,
        ),
        Container(
          width: 100.0,
          color: Colors.deepOrange,
        ),
        Container(
          width: 100.0,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: Image.network(
              "https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),
          title: Text(' 美国IPO规模创纪录，热潮预计在2021年持续'),
          subtitle: Text("投资者在2020年以创纪录的速度扎堆进行IPO，预计这种热潮不会很快消退。"),
        ),
        ListTile(
          leading: Image.network(
              "https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),
          title: Text('保监局50天开32罚单 “断供”违规资金为房市降温'),
          subtitle: Text("中国天气网讯 保监局50天开32罚单 “断供”违规资金为房市降温"),
        ),
        ListTile(
            title: Text('华北黄淮高温雨今起强势登场'),
            subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
            trailing: Image.network(
                "https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg")),
        ListTile(
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
          trailing: Icon(Icons.home),
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.yellow,
          ),
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('华北黄淮高温雨今起强势登场'),
          subtitle: Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
        )
      ],
    );
  }
}
