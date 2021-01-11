import 'package:flutter/material.dart';

class TopBarPage extends StatefulWidget {
  TopBarPage({Key key}) : super(key: key);

  _TopBarPageState createState() => _TopBarPageState();
}

class _TopBarPageState extends State<TopBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.black26,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child:TabBar(
                    isScrollable:true,  //如果多个的话可以滑动
                    indicatorColor:Colors.blue,
                    labelColor:Colors.blue,
                    unselectedLabelColor: Colors.white,
                    indicatorSize:TabBarIndicatorSize.label ,
                    
                    tabs: <Widget>[
                      Tab(text: "热销"),
                      Tab(text: "推荐"),
                      Tab(text: "推荐"),
                      Tab(text: "推荐"),
                      Tab(text: "推荐"),
                      Tab(text: "推荐")

                    ],
               ) ,
              )
            ],
          ),
          
        ),
        body:TabBarView(
          children: <Widget>[

            ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第一个tab")
                  ),
                  ListTile(
                    title:Text("第一个tab")
                  ),
                  ListTile(
                    title:Text("第一个tab")
                  )
                ],
              ),
            ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  )
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第3个tab")
                  ),
                  ListTile(
                    title:Text("第3个tab")
                  ),
                  ListTile(
                    title:Text("第一个tab")
                  )
                ],
              ),
            ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第4个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  )
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    title:Text("第4个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  ),
                  ListTile(
                    title:Text("第二个tab")
                  )
                ],
              ),
              Text('data')
          ],
        )
      ),
    );
  }
}