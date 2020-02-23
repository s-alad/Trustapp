import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
<<<<<<< HEAD
=======
import 'dart:async';
>>>>>>> 82539e33e3758ad384fbae3f6ff232fe2e7eb676
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
  
  @override
  void initState() 
  {
    print(1);
    _checkFirstTime();
    super.initState();
  }

  _checkFirstTime() async 
  {
    print(1.1);
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    _seen = (prefs.getBool('seen') ?? false);
    print(1.2);
  }  

  _updateFirstTime() async
  {
    _seen = true;
    prefs.setBool('seen', true);
  }

  @override
  Widget build(BuildContext context) 
  {
    print(2);
    bool seen = _seen;  
    if (_seen == false) {_updateFirstTime();}
    print(2.1);
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: seen ? HomeScreen() : SignUpScreen(),
    );
  } 
}


