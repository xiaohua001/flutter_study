

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sy_flutter_wechat/sy_flutter_wechat.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信 Demo',
      home: WxPay(),
    );
  }
}

class WxPay extends StatefulWidget {
  WxPay({Key key}) : super(key: key);

  _WxPayState createState() => _WxPayState();
}

class _WxPayState extends State<WxPay> {
  @override
  void initState() {
    super.initState();
    _register();
  }

  _register() async {
    bool result = await SyFlutterWechat.register('wx5881fa2638a2ca60');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("微信支付演示"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('分享文字'),
                onPressed: () async {
                  bool res = await SyFlutterWechat.shareText('hello world',
                      shareType: SyShareType.session);
                  print('分享文字：' + res.toString());
                },
              ),
              RaisedButton(
                child: Text('分享图片'),
                onPressed: () async {
                  bool res = await SyFlutterWechat.shareImage(
                      'https://imagepphcloud.thepaper.cn/pph/image/106/42/632.jpg',
                      shareType: SyShareType.timeline);
                  print('分享图片：' + res.toString());
                },
              ),
              RaisedButton(
                child: Text('分享网页'),
                onPressed: () async {
                  bool res = await SyFlutterWechat.shareWebPage(
                      '标题',
                      '描述',
                      'https://imagepphcloud.thepaper.cn/pph/image/106/42/632.jpg',
                      'http://www.xxxx.com',
                      shareType: SyShareType.session);
                  print('分享网页：' + res.toString());
                },
              ),
              RaisedButton(
                child: Text('支付'),
                onPressed: () async {
                  var apiUrl = 'http://www.xxx.com/wxpay/';
                  var myPayInfo = await Dio().get(apiUrl);
                  Map myInfo = json.decode(myPayInfo.data);
                  print(myInfo);

                  var payInfo = {
                    "appid": myInfo["appid"].toString(),
                    "partnerid": myInfo["partnerid"].toString(),
                    "prepayid": myInfo["prepayid"].toString(),
                    "package": myInfo["package"].toString(),
                    "noncestr": myInfo["noncestr"].toString(),
                    "timestamp": myInfo["timestamp"].toString(),
                    "sign": myInfo["sign"].toString(),
                  };
                  SyPayResult payResult =
                      await SyFlutterWechat.pay(SyPayInfo.fromJson(payInfo));

                  print(payResult);
                },
              ),
            ],
          ),
        ));
  }
}
