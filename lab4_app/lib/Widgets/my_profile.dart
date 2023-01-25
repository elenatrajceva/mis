import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed In as ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8,),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              } ,
              icon: Icon(Icons.arrow_back, size: 32,),
              label: Text(
                'Sing out',
                style: TextStyle(fontSize: 24),
                ))
          ]),
      ),
    );
  }
}