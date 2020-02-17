import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateScreen()),
  );
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
class CreateCreateButton extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: ()
      {
        Navigator.pop(context
  );
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
    String date = ('${month[now.month].toUpperCase()}, ${now.day}');
    String name;
    String total;

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
              '<NAME>',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold', height: 1)),
            ),
          ),
          Align(
            child: Text(
              '<TOTAL>',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            ),
          ),
        ],
      )
    );
  }
}

class Body extends StatelessWidget
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
              height: h * .6,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  TaskContainer(name: "hi", amount: "two fiddy", duedate: "hi o clock",),
                  TaskContainer(name: "faaggai", amount: "ahafahf fiddy", duedate: "hi o cloahah",),
                  TaskContainer(name: "asd", amount: "two fihahahahahddy", duedate: "hi o cannlock",),
                ],
              ),
            ),
            Container(
              height: h * .19,
              child: CreateButton(),
            )
          ],
        )
      ),
    );
  }
}

class CreateScreen extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CreateHeader(),
          CreateBody(),
        ]
      )
    );
  }
}

class CreateHeader extends StatelessWidget{
  @override
 Widget build(BuildContext context)
  {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * .2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Text(
              'Create New Task',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 34, fontFamily: 'Roboto-Bold', height: 1)),
            ),
          ),
          Align(
            child: Text(
              'other text idk',
              style: (TextStyle(color: Color(0xFF212121), fontSize: 22, fontFamily: 'Roboto-Medium', height: 1)),
            ),
          ),
        ],
      )
    );
}
}
class CreateBody extends StatelessWidget{
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
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),    
              child: TextField(
                
                  obscureText: false,
                  decoration: InputDecoration(
                  border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                 ),
                  ),
                  labelText: 'Task Name',
              ), 
              )        
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),    
              child: TextField(
                
                  obscureText: false,
                  decoration: InputDecoration(
                  border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                 ),
                  ),
                  labelText: 'Description of task',
              ), 
              )        
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, right: 75, left: 75),    
              child: TextField(
                
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                  border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                 ),
                  ),
                  labelText: 'Amount to Pledge',
              ), 
              )        
            ), 
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: TaskContainer(
                name: "pretend", amount: "this is", duedate: "a calendar",
              )
            ),
            CreateCreateButton()
              
          ],
        )
        
      ),
      
    ),
    
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
          Header(),
          Body(),
        ],
      ),
		);
	}
} 
