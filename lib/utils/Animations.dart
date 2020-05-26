import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trust/utils/TaskDatabase.dart';
import '../UI.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';


Route fadeRoute(var route)
{
  return PageRouteBuilder(
    pageBuilder: (c, a1, a2) => route,
    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
    transitionDuration: Duration(milliseconds: 110),
  );
}
