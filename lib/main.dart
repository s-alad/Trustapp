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
  bool _seen = false;
  
  Future<void> _checkFirstTime() async 
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    _seen = (prefs.getBool('seen') ?? false);
  }  

  Future<void> _updateFirstTime() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    _seen = true;
  }

  @override
  void initState() 
  {
    super.initState();
    _checkFirstTime();
  }

  @override
  Widget build(BuildContext context) 
  {
    bool seen = _seen;
    if (_seen == false) {_updateFirstTime();}
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: seen ? HomeScreen() : SignUpScreen(),
    );
  } 
}


