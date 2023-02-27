import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  
  Future initialse(BuildContext context) async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // print('User granted permission: ${settings.authorizationStatus}');

    //Terminated and opened the app from terminated state.
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data["route"];
        print(routeFromMessage);
      
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    //Foreground.
    FirebaseMessaging.onMessage.listen((message) {
      if(message != null){
        print(message.notification!.title);
        print(message.notification!.body);
      }
    });

    //Background and when clicked on the notifiction.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      //print(routeFromMessage);

      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }
  
}
