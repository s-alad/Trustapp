import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'HomeScreen.dart';
import 'SignUpScreen.dart';

void main() => runApp(App());

class App extends StatelessWidget 
{
  Future<int> _checkFirstTime() async 
  {
    final prefs = await SharedPreferences.getInstance();
    final check = prefs.getInt('firstTime');
    if (check == null)
    {
      prefs.setInt('firstTime', 1);
      return 0;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) 
  {
    if (_checkFirstTime() == 0)
    {
      return MaterialApp
      (
        debugShowCheckedModeBanner: false,
        home: SignUpScreen(),
      );
    }
    else
    {
      return MaterialApp
      (
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    }
  }
}

