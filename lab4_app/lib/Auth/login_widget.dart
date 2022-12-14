
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab3_app/Auth/utils.dart';

import '../main.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void despose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                SizedBox(height: 40,),
                TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 4,),
                TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50)
                    ),
                  onPressed: signIn, 
                  icon: Icon(Icons.lock_open, size: 23,), 
                  label: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 24),
                  ),
                  ),
                  SizedBox(height: 24,),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'No account?  ',
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                          text: 'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.background
                          )
                        )
                      ]
                    )
                  ),
              ]),
      );

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator())
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    } on FirebaseAuthException catch (e){
      print(e);
      
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

}
