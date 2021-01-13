import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwiperPage(),
    );
  }
}

class SwiperPage extends StatefulWidget {
  SwiperPage({Key key}) : super(key: key);

  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {

  List<Map> imgList=[
    {
      "url":"https://imagepphcloud.thepaper.cn/pph/image/107/41/632.jpg"
    },
    {
      "url":"https://imagepphcloud.thepaper.cn/pph/image/106/41/631.jpg"
    },
    {
      "url":"https://imagepphcloud.thepaper.cn/pph/image/106/42/630.jpg"
    },
     {
      "url":"https://imagepphcloud.thepaper.cn/pph/image/106/42/632.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图组件演示'),
      ),
      body:Column(
          children: <Widget>[
            
              Container(
                 // width: double.infinity,适配宽度100%
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        imgList[index]["url"],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: imgList.length,
                    pagination: new SwiperPagination(),
                    // control: new SwiperControl(),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text("我是一个文本")
                ],
              )


          ],
      )
    );
  }
}
