import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trust/utils/TaskDatabase.dart';
import '../UI.dart';
import 'CreateTaskScreen.dart';
import 'CalanderScreen.dart';
import 'HomeScreen.dart';
import '../models/Task.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'DetailScreen.dart';
import 'package:flutter/cupertino.dart';
import '../utils/Animations.dart';

class CalanderHeader extends StatefulWidget
{
  @override
  _CalanderHeader createState() => _CalanderHeader();
}
class _CalanderHeader extends State<CalanderHeader>
{  
  String date; String time;

  @override
  void initState() 
  {
    date = DateFormat('EEEE, MMMM d').format(DateTime.now());
    time = DateFormat('h:mm a').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }
  void _getTime()
  {
    setState(() 
    {
      date = DateFormat('EEEE, MMMM d').format(DateTime.now());
      time = DateFormat('h:mm a').format(DateTime.now());
    });
  }

  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: Color(0xFFE8E9EB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(40, 30),
          bottomRight: Radius.elliptical(40, 30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: w,
            height: 115,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomLeft: Radius.elliptical(40, 30),
                bottomRight: Radius.elliptical(40, 30),
              )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text(time, style: TextStyle(fontSize: 36)),
                  ),
                  Center(
                    child: Text(date, style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalanderBody extends StatefulWidget
{
  @override
  _CalanderBody createState() => _CalanderBody();
}
class _CalanderBody extends State<CalanderBody>
{
  @override
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        CalanderHeader(),
        Expanded(child: Container(),),
        BottomNavBar(
          lRoute: DetailScreen(), rRoute: CalanderScreen(), home: Icons.assignment,
          navCallBack: () {Navigator.push(context, fadeRoute(HomeScreen()));}
        ),
      ],
    );
  }
}

class CalanderScreen extends StatefulWidget
{
  @override
  _CalanderScreen createState() => _CalanderScreen();
}
class _CalanderScreen extends State<CalanderScreen> 
{
	@override
	Widget build(BuildContext context)
	{
		return Scaffold(
      backgroundColor: Color(0xFF3A3D40),
			body: CalanderBody(),
		);
	}
} 