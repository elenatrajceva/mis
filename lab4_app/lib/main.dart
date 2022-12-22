import 'package:flutter/material.dart';
import 'Auth/login_widget.dart';
import 'Screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen();
            } else {
              return LoginWidget(); 
            }
          },
        ));

}

