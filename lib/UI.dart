import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trust/main.dart';
import 'screens/CreateTaskScreen.dart';

typedef void ButtonCallback();
class Button extends StatelessWidget
{
  ButtonCallback clicked;

  String text;double width;Color color;Color fontColor;double font;double height;
  //preset buttons
  Button.createtask({this.clicked}) 
  {
    this.text = "+"; 
    this.width = .2; 
    this.height = .08;
    this.color = Color.fromRGBO(254, 249, 205, 1); 
    this.fontColor = Color(0xFF323639); 
    this.font = 26;
  }
  Button.create({this.clicked})
  {
    this.text = "CREATE";
    this.width = .3;
    this.height = .08;
    this.color = Color.fromRGBO(254, 249, 205, 1); 
    this.fontColor = Color(0xFF323639); 
    this.font = 26;
  }
  Button.back({this.clicked})
  {
    this.text = "BACK";
    this.width = .3;
    this.height = .06;
    this.color = Colors.transparent;
    this.fontColor = Colors.white;
    this.font = 26;
  }
  Button({this.text, this.width, this.height, this.color, this.fontColor, this.font, this.clicked}); 

  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      
      onTap: () {clicked();},
      
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: h * height,
          width: w * width,
          margin: EdgeInsets.only(bottom: h * .0075),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: (TextStyle(color: fontColor, fontSize: 24, fontFamily: 'Roboto-Medium')),
            ),
          ),
          decoration: new BoxDecoration(
            color: color,
            borderRadius: new BorderRadius.all(Radius.circular(12))
          )
        ),
      ),
    );
  }
}

typedef void StringCallback(String s);
class DatePicker extends StatelessWidget
{
  final DateTime _dateTime = DateTime.now();
  //init callback
  final StringCallback onDateChanged;
  final StringCallback onTimeChanged;
  DatePicker({ @required this.onDateChanged, this.onTimeChanged});
  
  Widget build(BuildContext context)
  {
    double h = MediaQuery.of(context).size.height;

    return Container(
      height: h * .25,
      decoration: new BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: new BorderRadius.all(const Radius.circular(32),)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(
            height: .8,
            color: Color(0xFF212121),
            thickness: 2.4,
            indent: 32,
            endIndent: 32,
          ),
          SizedBox(
            height: h * .1,
            width: 300,
            child: CupertinoDatePicker(
              //backgroundColor: Color(0xFFFFFFF0),
              initialDateTime: _dateTime,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime) {onDateChanged(dateTime.toString().split(" ")[0]);}
            )
          ),
          Divider(
            color: Color(0xFF212121),
            thickness: 2.4,
            indent: 32,
            endIndent: 32,
          ),
          SizedBox(
            height: h * .1,
            width: 300,
            child: CupertinoDatePicker(
              //backgroundColor: Color(0xFFFFFFF0),
              initialDateTime: _dateTime,
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (dateTime) {onTimeChanged(dateTime.toString().split(" ")[1]);}
            ),
          ),
          Divider(
            height: .8,
            color: Color(0xFF212121),
            thickness: 2.4,
            indent: 32,
            endIndent: 32,
          ),
        ],
      ),
    );
  }
}