import 'package:flutter/material.dart';
import 'package:lab3_app/Auth/login_widget.dart';
import 'package:lab3_app/Auth/signup_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin 
      ? LoginWidget(onClickedSignUp: toggle)
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin );    
}
