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
<<<<<<< HEAD
        if (state == true) {Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreen()),);}
=======
        if (state == true)
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );
        }
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
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
      
<<<<<<< HEAD
      onTap: () {Navigator.pop(context);},
=======
      onTap: ()
      {
        Navigator.pop(context);
      },
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
      
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

<<<<<<< HEAD
    return Column(
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
=======
<<<<<<< HEAD
    return Column(
      children: <Widget>[
        SizedBox(
          height: h * .08,
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
          child: CupertinoDatePicker(
            backgroundColor: Color(0xFFFFFFF0),
            initialDateTime: _dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {}
          )
        ),
<<<<<<< HEAD
        Divider(
          color: Color(0xFF212121),
          thickness: 2.4,
          indent: 32,
          endIndent: 32,
        ),
        SizedBox(
          height: h * .1,
=======
        SizedBox(
          height: h * .08,
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
          child: CupertinoDatePicker(
            backgroundColor: Color(0xFFFFFFF0),
            initialDateTime: _dateTime,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (dateTime) {}
          ),
        ),
<<<<<<< HEAD
        Divider(
          height: .8,
          color: Color(0xFF212121),
          thickness: 2.4,
          indent: 32,
          endIndent: 32,
        ),
      ],
=======
      ],
=======
    return SizedBox(
      height: h * .1,
      child: CupertinoDatePicker(
        backgroundColor: Color(0xFFFFFFF0),
        initialDateTime: _dateTime,
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (dateTime) {
        }
      )
>>>>>>> 8303c030086603deadb9dc35b009118b20d9557f
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
    );
  }
}