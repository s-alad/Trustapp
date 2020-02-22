import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CreateTaskScreen.dart';

class CreateButton extends StatelessWidget
{
  CreateButton({this.state});
  final bool state;

  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      
      onTap: ()
      {
        if (state == true)
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );
        }
        else {Navigator.pop(context);}
      },
      
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: h * .08,
          width: w * .8,
          margin: EdgeInsets.only(bottom: h * .024),
          child: Center(
            child: Text(
              'CREATE NEW TASK',
              textAlign: TextAlign.center,
              style: (TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Roboto-Medium')),
            ),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0, 
              spreadRadius: 0.0, 
              offset: Offset(
                0.0,
                4.0, 
              ),
            )
            ],
            color: Color(0xFF212121),
            borderRadius: new BorderRadius.all(Radius.circular(12))
          )
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      
      onTap: ()
      {
        Navigator.pop(context);
      },
      
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: h * .08,
          width: w * .8,
          margin: EdgeInsets.only(bottom: h * .024),
          child: Center(
            child: Text(
              'Back',
              textAlign: TextAlign.center,
              style: (TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Roboto-Medium')),
            ),
          ),
          decoration: new BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0, 
              spreadRadius: 0.0, 
              offset: Offset(
                0.0,
                4.0, 
              ),
            )
            ],
            color: Color(0xFF212121),
            borderRadius: new BorderRadius.all(Radius.circular(12))
          )
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget
{
  final DateTime _dateTime = DateTime.now();

  Widget build(BuildContext context)
  {
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        SizedBox(
          height: h * .08,
          child: CupertinoDatePicker(
            backgroundColor: Color(0xFFFFFFF0),
            initialDateTime: _dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {}
          )
        ),
        SizedBox(
          height: h * .08,
          child: CupertinoDatePicker(
            backgroundColor: Color(0xFFFFFFF0),
            initialDateTime: _dateTime,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (dateTime) {}
          ),
        ),
      ],
    );
  }
}