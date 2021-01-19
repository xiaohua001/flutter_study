


import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app升级 Demo',
      home: AppVersionPage(),
    );
  }
}

class AppVersionPage extends StatefulWidget {
  AppVersionPage({Key key}) : super(key: key);

  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {

  @override
  void initState(){

    
    super.initState();

    this._getPackageInfo();

    this._getAppPath();

    

  }
  //弹出Dialog
  _showDialog() async{
    // ignore: unused_local_variable
    var alertRel=await showDialog(
        context: context,
        builder: (context){
            return AlertDialog(
                title: Text("更新APP提示!"),
                content: Text("发现新的版本，新版本修复了如下bug 是否更新!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("否"),
                    onPressed: (){
                        Navigator.pop(context,'Cancle');
                    },
                  ),
                   FlatButton(
                    child: Text("是"),
                    onPressed: (){
                      Navigator.pop(context,'Ok');
                    },
                  )
                ],
            );
        }
      );
    
  }

  //获取版本号
  _getPackageInfo() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    

    print("appName:$appName"); // yarm 的name

    print("packageName:$packageName"); //manifest里面

    print("version:$version");  // yarm 的version
    
    print("buildNumber:$buildNumber");//manifest里面

  }

//获取路径
  _getAppPath() async{
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var directory = await getExternalStorageDirectory();

    
    String storageDirectory=directory.path;


    print("tempPath:$tempPath");

    print("appDocDir:$appDocPath");

    print("StorageDirectory:$storageDirectory");
  }

  //下载打开文件
  _downLoad()async {
         
         final directory = await getExternalStorageDirectory();
         String _localPath = directory.path;

        // ignore: unused_local_variable
        final taskId = await FlutterDownloader.enqueue(
          url: "http://www.xxx.com/xxx.apk",
          savedDir: _localPath,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
       
        FlutterDownloader.registerCallback((id, status, progress) {

          print(status);
          // code to update your UI
          print('1111111');
          print(progress);
        });      

        //打开文件
        OpenFile.open("$_localPath/xxx.apk");
     
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_downward),
       onPressed: _downLoad,
     ),
      appBar: AppBar(
        title: Text("app升级演示"),
      ),
      body:RaisedButton(onPressed: _showDialog,child: Text('点击弹出下载'),),
    );
  }
}