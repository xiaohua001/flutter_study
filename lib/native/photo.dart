import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: ImagePickerPage(),
    );
  }
}

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerPage> {

final ImagePicker picker = new ImagePicker();
File _userImage;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImagePicker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _takePhoto,
                child: Text("拍照"),
              ),
              RaisedButton(
                onPressed: _openGallery,
                child: Text("选择图库照片"),
              ),
              _buildImage()
            ],
          ),
        ));
  }

Future _takePhoto() async {
  final cameraImages = await picker.getImage(source: ImageSource.camera);
  if (mounted) {
    setState(() {
      //拍摄照片不为空
      if (cameraImages != null) {
        _userImage = File(cameraImages.path);
        print('你选择的路径是：${_userImage.toString()}');
        //图片为空
      } else {
        print('没有照片可以选择');
      }
    });
  }
}
Future _openGallery() async {
  //选择相册
  final pickerImages = await picker.getImage(source: ImageSource.gallery);
  if(mounted){
    setState(() {
      if(pickerImages != null){
        _userImage = File(pickerImages.path);
        print('你选择的本地路径是：${_userImage.toString()}');
      }else{
        print('没有照片可以选择');
      }
    });
  }
}

  

  //定义一个组件显示图片
  Widget _buildImage() {
    if (this._userImage == null) {
      return Text("请选择图片...");
    }
    return Image.file(this._userImage);
  }


}
