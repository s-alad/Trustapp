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
  bool _seen;
  
  @override
  void initState() 
  {
    _checkFirstTime();
    super.initState();
  }

  _checkFirstTime() async 
  {
    print(1.1);
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    setState( () 
    {
      _seen = (prefs.getBool('seen') ?? false);
    });
  }  

  _updateFirstTime() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    _seen = true;
    prefs.setBool('seen', true);
  }

  Widget build(BuildContext context) 
  {
    if (_seen == null) return Container();
    if (_seen == false) {_updateFirstTime();}

    bool seen = _seen;  
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  } 
}


