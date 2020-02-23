import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();  
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


