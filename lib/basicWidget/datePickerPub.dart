import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatePickerPubDemo(),
    );
  }
}

class DatePickerPubDemo extends StatefulWidget {
  DatePickerPubDemo({Key key}) : super(key: key);

  _DatePickerPubDemoState createState() => _DatePickerPubDemoState();
}
  
class _DatePickerPubDemoState extends State<DatePickerPubDemo> {

  DateTime _dateTime=DateTime.now();

  _showDatePicker(){
      DatePicker.showDatePicker(
          context,
          pickerTheme: DateTimePickerTheme(
            showTitle: true,
            confirm: Text('确定', style: TextStyle(color: Colors.red)),
            cancel: Text('取消', style: TextStyle(color: Colors.cyan)),
          ),
          minDateTime: DateTime.parse("1980-05-12"),
          maxDateTime: DateTime.parse("2100-05-12"),
          initialDateTime: _dateTime,
          // dateFormat: "yyyy-MMMM-dd",

          dateFormat:'yyyy年M月d日    EEE,H时:m分',  // show TimePicker
          pickerMode: DateTimePickerMode.datetime,  // show TimePicker

           
          locale: DateTimePickerLocale.zh_cn,
          onCancel: () {
            debugPrint('onCancel');
          },         
          onConfirm: (dateTime, List<int> index) {
            setState(() {
              _dateTime = dateTime;
            });
          },
      );  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期选择"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              InkWell(
                child: Row(
                  children: <Widget>[

                    Text("${formatDate(_dateTime, [yyyy, '年', mm, '月', dd,' ',HH, ':', nn])}"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ), 
                onTap: _showDatePicker
            ),         
           ],
         ),
       ]
      )
    );  
  }

}