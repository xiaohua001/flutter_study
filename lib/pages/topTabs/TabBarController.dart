import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {

  TabController _tabController; // 要使用tabController组件，必须是继承StatefulWidget的动态组件，并且还要实现SingleTickerProviderStateMixin这个类，

  @override
  void dispose() {  
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() { 
    super.initState();
    _tabController=new TabController(
      vsync: this,
      length: 2
    );
    // _tabController.addListener((){

    //   print(_tabController.index);     
    // });
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: this._tabController,  //注意
          tabs: <Widget>[
            Tab(text:"热销"),
            Tab(text:"推荐"),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,  //注意
        children: <Widget>[
          Center(child: Text("热销")),
          Center(child: Text("推荐"))
          
        ],
      ),
    );
  }
}