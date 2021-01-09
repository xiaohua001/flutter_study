/* 
ListView.builder 基于Sliver的懒加载模型 适合列表项比较多（或者无限）的情况
*/
import 'package:flutter/material.dart';
import '../testData/listData.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 根组件.
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
    Widget _getListData(context,index){
        return ListTile(           
            title: Text(listData[index]["title"]),
            leading:Image.network(listData[index]["imageUrl"]),          
            subtitle:Text(listData[index]["author"])
        );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ListView.builder(
          itemExtent: 20.0, //强制高度为20.0
         //  itemCount: 100,
          // itemBuilder: (BuildContext context, int index) {
          //   return ListTile(title: Text("$index"));
          // },
          itemCount:listData.length,      
          itemBuilder:this._getListData   //根据动态数据引用自定义方法 
          ),
     // child:ListView3() ,// 使用分割组件包裹示例
       height: 400,
       width: 300,
    ));
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。  
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index%2==0?divider1:divider2;
        },
    );
  }
}