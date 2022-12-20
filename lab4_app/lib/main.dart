import 'package:flutter/material.dart';
import 'package:lab3_app/Screens/calendar_screen.dart';
import 'Screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Exams',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => MainScreen(),
      //   '/calendar':(context) => CalendarScreen(),
      // },
      home: MainScreen(),
    );
  }
}


