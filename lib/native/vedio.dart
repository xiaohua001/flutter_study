
import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChewieVideoDemo(),
    );
  }
}

class ChewieVideoDemo extends StatefulWidget {
  ChewieVideoDemo({Key key}) : super(key: key);

  _ChewieVideoDemoState createState() => _ChewieVideoDemoState();
}

class _ChewieVideoDemoState extends State<ChewieVideoDemo> {

  // VideoPlayerController videoPlayerController;
  // ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    // videoPlayerController = VideoPlayerController.network(
    // 'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');

    // chewieController = ChewieController(
    //   videoPlayerController: videoPlayerController,
    //   aspectRatio: 3 / 2,
    //   autoPlay: true,
    //   looping: true,
    // );


  }
  /*销毁*/
  @override
  void dispose() {
    // videoPlayerController.dispose();
    // chewieController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('在线视频播放'),
      ),
      body: Center(
        // child: Chewie(
        //   controller: chewieController,
        // )
      ),
    );
  }
}
