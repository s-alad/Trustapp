import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'SignUpScreen.dart';

class CreateButton extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ()
      {

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
            color: Color(0xFF212121),
            borderRadius: new BorderRadius.all(Radius.circular(12))
          )
        ),
      ),
    );
  }
}

class TaskContainer extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Align(
    alignment: Alignment.center,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: h * .16,
        width: w * .8,
        margin: EdgeInsets.only(bottom: h * .024),
        decoration: new BoxDecoration(
          color: Color(0xFFA1FF9D),
          borderRadius: new BorderRadius.all(Radius.circular(12))
        ),
      ),
    ); 
  }
}

class TopHeader extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    String date;
    String name;
    String total;

    return Container(
      width: w,
      height: h * .25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Text(
              '<dec 30>',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium')),
            ),
          ),
          Align(
            child: Text(
              '<name>',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold')),
            ),
          ),
          Align(
            child: Text(
              '<total>',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium')),
            ),
          ),
        ],
      )
    );
  }
}

class HomeScreen extends StatelessWidget 
{
	@override
	Widget build(BuildContext context)
	{
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

		return Scaffold(
      backgroundColor: Colors.white,
			body: Column(
        children: <Widget>[
          TopHeader(),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: h * .75,
              width: w,  
              decoration: new BoxDecoration(
                border: Border.all(color: Color(0xFF707070)),
                color: Color(0xFFFFFFF0),
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(32),
                  topRight: const Radius.circular(32),
                )
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        TaskContainer(),
                        TaskContainer(),
                        TaskContainer(),
                      ],
                    ),
                  ),
                  CreateButton(),
                ],
              )
            ),
          ),
        ],
      ),
		);
	}
} 
