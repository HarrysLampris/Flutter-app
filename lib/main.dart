import 'package:flutter/material.dart';
import './splashscreen.dart';
import './home.dart';
import './cardpage.dart';
import './article1.dart';

void main() {
  runApp(MaterialApp(
    title: 'Multiple screens',
    initialRoute: '/splashscreen',
    routes: {
      '/': (context) => MyApp(), //οριζουμε τα μονοπατια NamedRoutes
      '/splashscreen': (context) => SplashScreen(),
      '/homepage': (context) => HomePage(),
      '/article1': (context) => Article1(),
      '/article2': (context) => Article2(),
      '/article3': (context) => Article3(),
      '/article4': (context) => Article4(),
      '/article': (context) => Article(),
      '/questions1': (context) => Question1()
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}