import 'package:flutter/material.dart';
import '../testData/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  value["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(value["imageUrl"])),
                title: Text(value["title"]),
                subtitle: Text(value["author"],
                    maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              // 直接设置了容器的显示比例
              // Container(
              //   width: 200,
              //   child: AspectRatio(
              //     aspectRatio: 3.0 / 1.0,
              //     child: Container(
              //       color: Colors.red,
              //     ),
              //   ),
              // )
            ],
          ),
        );
      }).toList(),
    );
  }
}
