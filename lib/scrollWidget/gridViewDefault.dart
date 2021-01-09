import 'package:flutter/material.dart';

import '../testData/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo2')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  List<Widget> _getListData() {
      var tempList=listData.map((value){
          return Container(            
            child:Column(
                children: <Widget>[
                  Image.network(value['imageUrl']),
                  SizedBox(height: 12),
                  Text(
                    value['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  )
                ],

            ),
            decoration: BoxDecoration(

              border: Border.all(
                color:Color.fromRGBO(233, 233,233, 0.9),
                width: 1
              )
            ),
              
            // height: 400,  //设置高度没有反应
          );

      });
      return tempList.toList();
  }
  @override
  Widget build(BuildContext context) {
    return GridView(
        //注意两种不同的布局，一种是固定数量 、另一种是固定长度
        //  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   crossAxisSpacing :10.0,
        //   mainAxisSpacing :30.0,
        //   maxCrossAxisExtent: 120.0,     // 固定最大长度
        //    childAspectRatio: 2.0 //宽高比为2
        //   ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.0, //水平子 Widget 之间间距
          mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
          crossAxisCount: 2, //一行的 Widget 数量
        ),
       
       
        // children: <Widget>[
        //   Icon(Icons.ac_unit),
        //   Icon(Icons.airport_shuttle),
        //   Icon(Icons.all_inclusive),
        //   Icon(Icons.beach_access),
        //   Icon(Icons.cake),
        //   Icon(Icons.free_breakfast)
        // ]
         children: this._getListData(),// 也可以自定义方法加载动态数据
        );
  }

  //   Widget build(BuildContext context) {                //SliverGridDelegateWithFixedCrossAxisCount的另一种写法
  //   return GridView.count(
  //      crossAxisCount: 3,
  //       children: <Widget>[
  //         Icon(Icons.ac_unit),
  //         Icon(Icons.airport_shuttle),
  //         Icon(Icons.all_inclusive),
  //         Icon(Icons.beach_access),
  //         Icon(Icons.cake),
  //         Icon(Icons.free_breakfast)
  //       ]);
  //  }
 
  // Widget build(BuildContext context) {                  //SliverGridDelegateWithMaxCrossAxisExtent的另一种写法
  //   return GridView.extent(
  //     maxCrossAxisExtent: 120.0,
  //     children: <Widget>[
  //     Icon(Icons.ac_unit),
  //     Icon(Icons.airport_shuttle),
  //     Icon(Icons.all_inclusive),
  //     Icon(Icons.beach_access),
  //     Icon(Icons.cake),
  //     Icon(Icons.free_breakfast)
  //   ]);
  // }
}
