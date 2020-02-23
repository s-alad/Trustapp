import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
<<<<<<< HEAD
import 'UI.dart';
=======
<<<<<<< HEAD
import 'UI.dart';
=======
import 'ui.dart';
>>>>>>> 8303c030086603deadb9dc35b009118b20d9557f
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676

class TaskContainer extends StatelessWidget
{
  //defining variables for each of the cards to read from 
  TaskContainer({this.name,this.amount,this.duedate,});
  final String name;
  final String amount;
  final String duedate;

  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Align(
    alignment: Alignment.center,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: h * .14,
        width: w * .8,
        margin: EdgeInsets.only(bottom: h * .024),
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
          color: Color(0xFFa3ff9e),
          borderRadius: new BorderRadius.all(Radius.circular(12))
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 14),
                  child: Text(
                    name,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 24, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    amount,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 20, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14, top: 42),
                  child: Text(
                    duedate,
                    style: (TextStyle(color: Color(0xFF707070), fontSize: 18, fontFamily: 'Roboto-Medium', height: 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}

class Header extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var now = new DateTime.now();
    var month = ['january','febuary','march','april','may','june','july','august','september','october','november','december'];
<<<<<<< HEAD
    String date = ('${month[now.month - 1].toUpperCase()}, ${now.day}');
=======
<<<<<<< HEAD
    String date = ('${month[now.month - 1].toUpperCase()}, ${now.day}');
=======
    String date = ('${month[now.month].toUpperCase()}, ${now.day}');
>>>>>>> 8303c030086603deadb9dc35b009118b20d9557f
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
    String name = '<NAME>';
    String total = '<TOTAL>';

    return Container(
      width: w,
      height: h * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: Text(
              date,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            )
            )
          ),
          Align(
            child: Text(
              name,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold', height: 1)),
            ),
          ),
          Align(
            child: Text(
              total,
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            ),
          ),
        ],
      )
    );
  }
}

class Body extends StatefulWidget
{
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body>
{
  @override
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment(0, 1),
      child: Container( 
        height: h * .8, 
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
            Container(
              //color: Colors.blue,
              height: h * .64,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  TaskContainer(name: "<task name>", amount: "\$amt", duedate: "<date>"),
                  TaskContainer(name: "<task name>", amount: "\$amt", duedate: "<date>"),
                  TaskContainer(name: "<task name>", amount: "\$amt", duedate: "<date>"),
                  TaskContainer(name: "<task name>", amount: "\$amt", duedate: "<date>"),
<<<<<<< HEAD
                  TaskContainer(name: "<task name>", amount: "\$amt", duedate: "<date>"),
=======
<<<<<<< HEAD
=======

>>>>>>> 8303c030086603deadb9dc35b009118b20d9557f
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
                ],
              ),
            ),
            Container(
<<<<<<< HEAD
              height: h * .15,
              //color: Colors.red,
=======
              height: h * .19,
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
              child: CreateButton(state: true,),
            )
          ],
        )
      ),
    );
  }
}

class HomeScreen extends StatelessWidget 
{
	@override
	Widget build(BuildContext context)
	{

		return Scaffold(
      backgroundColor: Colors.white,
			body: Column(
        children: <Widget>[
          Header(),
          Body(),
        ],
      ),
		);
	}
} 
