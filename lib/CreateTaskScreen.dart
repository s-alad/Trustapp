import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ui.dart';

class CreateScreen extends StatelessWidget 
{
  @override
  Widget build (BuildContext ctxt) 
  {
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

class CreateHeader extends StatelessWidget
{
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
              'CREATE NEW TASK',
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

class CreateBody extends StatelessWidget
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
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: DatePicker(),
              ),
              CreateButton(state: false),
              GoBackButton(),
            ],
          ) 
        ),
      ),
    );
  }
}

