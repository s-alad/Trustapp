import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/HomeScreen.dart';
import 'screens/SignUpScreen.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatefulWidget 
{
  @override
  _App createState() => new _App();
}

class _App extends State<App>
{
  bool _seen;
  
  @override
  void initState() 
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark, 
    ));
    _checkFirstTime();
    super.initState();
  }

  _checkFirstTime() async 
  {
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
      home: seen ? HomeScreen() : SignUpScreen(),
    );
  } 
}
