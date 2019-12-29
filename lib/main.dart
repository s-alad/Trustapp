import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'HomeScreen.dart';
import 'SignUpScreen.dart';

void main() => runApp(Start());

class Start extends StatefulWidget 
{
  @override
  App createState() => new App();
  
}

class App extends State<Start>
{
  Future<int> _checkFirstTime() async 
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen)
    {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new HomeScreen())
      );
    }
    else 
    {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new SignUpScreen())
      );
    }
  }  

  @override
  void initState() 
  {
    super.initState();
    new Timer(new Duration(seconds: 1), () {
      _checkFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadScreen(),
    );
  }
}

class LoadScreen extends StatelessWidget
{
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
