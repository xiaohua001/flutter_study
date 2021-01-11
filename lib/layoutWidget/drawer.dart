import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: Text('data'),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Expanded(
                //     child: DrawerHeader(
                //         child: Text("你好flutter"),
                //         decoration: BoxDecoration(
                //             color: Colors.yellow,
                //             image: DecorationImage(
                //               image: NetworkImage(
                //                   "https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),
                //               fit: BoxFit.cover,
                //             )))
                // )
                  Expanded(
                    child: UserAccountsDrawerHeader(
                      accountName:Text("测试测试"),
                      accountEmail: Text("54564652@qq.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage("https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),                        
                      ),
                      decoration:BoxDecoration(                        
                        image: DecorationImage(
                          image: NetworkImage("https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1625970267,111828339&fm=26&gp=0.jpg"),
                          fit:BoxFit.cover,
                        )
                        
                      ),
                     otherAccountsPictures: <Widget>[
                       Image.network("https://imagepphcloud.thepaper.cn/pph/image/106/43/633.jpg"),
                       Image.network("https://imagepphcloud.thepaper.cn/pph/image/107/41/635.jpg"),
                     ],
                    )
                  )
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("用户中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置中心"),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    ));
  }
}
