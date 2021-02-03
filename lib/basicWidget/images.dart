import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          // 两种不同加载方式以及书写形式
          // child: Image.asset('images/a.jpeg', fit: BoxFit.cover),

          //  child: Image.network("http://n.sinaimg.cn/mil/8_img/upload/a4a6e641/324/w700h424/20201231/446f-kfxsuvx3354759.jpg",width: 50.0,),

          //  child: Image(image: AssetImage("images/a.jpeg"), width: 150.0),




          // 设置圆形图片
//           child: ClipOval(
//                 child: Image.network(
//                   'http://n.sinaimg.cn/mil/8_img/upload/a4a6e641/324/w700h424/20201231/446f-kfxsuvx3354759.jpg',
//                   height: 100,
//                   width: 100, // 一般配合ClipOval
//                   fit: BoxFit.cover,
//                 ),
//             ),


//          child: CircleAvatar(
//            radius: 10,
//            backgroundImage: NetworkImage("http://n.sinaimg.cn/mil/8_img/upload/a4a6e641/324/w700h424/20201231/446f-kfxsuvx3354759.jpg"),
//            child: Container(
//                alignment: Alignment(0, .5),
//                width: 100,
//                height: 100,
//                child: Text("hh")
//            ),
//          ),

          // 图片对齐以及其它属性
//            child: Image.network(
//               "http://n.sinaimg.cn/mil/8_img/upload/a4a6e641/324/w700h424/20201231/446f-kfxsuvx3354759.jpg",
//                alignment: Alignment.bottomRight, // 配合父容器宽高
//               // color: Colors.blue,
//               // colorBlendMode: BlendMode.screen,
//
//               // fit:BoxFit.cover,
//               // repeat:ImageRepeat.repeat
//             ),


          height: 400,
          width: 400,


          // 设置圆角
//           decoration: BoxDecoration(
//               color: Colors.yellow,
//               // borderRadius: BorderRadius.all(
//               //   Radius.circular(150),
//               // )
//               borderRadius: BorderRadius.circular(50),
//               image: DecorationImage(
//                   image: NetworkImage(
//                       "http://n.sinaimg.cn/mil/8_img/upload/a4a6e641/324/w700h424/20201231/446f-kfxsuvx3354759.jpg"),
//                   fit: BoxFit.cover)
//             ),
        ));
  }
}
