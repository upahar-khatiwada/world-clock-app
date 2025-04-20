import 'package:flutter/material.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/screens/location.dart';
import 'package:world_clock/screens/loading.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ),
  );
}
