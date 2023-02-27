import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lab3_app/Services/push_notification_service.dart';
import 'Auth/auth_page.dart';
import 'Auth/login_widget.dart';
import 'Auth/utils.dart';
import 'Screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab3_app/Screens/calendar_screen.dart';

//Background
Future<void> backgroundHandler(RemoteMessage message) async{
  print(message.data.toString());
}
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
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
      routes: {
        "calendar":(context) => CalendarScreen(),
      },
    );
  }

}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            }else if (snapshot.hasData) {
              return MainScreen();
            }else {
              return AuthPage(); 
            }
          },
        ));

}

