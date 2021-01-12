// import 'package:flutter_localizations/flutter_localizations.dart'; 
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatePickerDemo(),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   //此处
      //   const Locale('zh', 'CH'),
      //   const Locale('en', 'US'),
      // ],
      // locale: const Locale('zh'), 
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  DatePickerDemo({Key key}) : super(key: key);

  _DatePickerDemoState createState() => _DatePickerDemoState();
}
class _DatePickerDemoState extends State<DatePickerDemo> {

  DateTime _nowDate =DateTime.now();

  var _nowTime=TimeOfDay(hour: 12,minute:20 );
  
 _showDatePicker() async{
    //  showDatePicker(
    //    context:context,
    //    initialDate:_nowDate,
    //    firstDate:DateTime(1980),
    //    lastDate:DateTime(2100),
    //  ).then((result){
    //     print(result);
    //     setState(() {
    //       if(result!=null){
    //         this._nowDate= result;
    //       }
    //  });
    //  });

    var result= await showDatePicker(
       context:context,
       initialDate:_nowDate,
       firstDate:DateTime(1980),
       lastDate:DateTime(2100),
       // locale: Locale('zh'),      //非必须
     );
     setState(() {
       if(result!=null){
        this._nowDate= result;
       }
     });

 }

 _showTimePicker() async{

      var result= await showTimePicker(
        context:context,
        initialTime: _nowTime
      );
      setState(() {
       if(result!=null){
        this._nowTime= result;
       }
     });
 }

  @override
  void initState() {
    super.initState();

     var now =DateTime.now();
     // year、month、day、weekday、hour、minute、second、millisecond、microsecond 获取年、月、日、星期、时、分、秒、毫秒、微妙
    print(now); 
    print(now.year); 


    print(now.millisecondsSinceEpoch);  //时间戳


     print(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch));   //时间戳转换为日期


     print(formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd,'日',hh,'时',nn,'分',ss,'秒']));    //第三方包 按格式显示


  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[         
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${formatDate(_nowDate, [yyyy, '年', mm, '月', dd,'日'])}"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showDatePicker,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${_nowTime.format(context)}"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showTimePicker,
              )
            ],
          )
        ],
      ),   
         
    );
  }
}