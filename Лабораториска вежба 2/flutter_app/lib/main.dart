import 'package:flutter/material.dart';

import './clothes_questions.dart';
import './clothes_answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State <StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  void _ButtonTapped(){
    setState(() {
      _questionIndex += 1;
    });
    print("Button was tapped");
  }

  var questions = [
    {'question' : "Select style:",
    'answer' : ['Classic', 'Party style', 'Street style']},
    {'question' : "Select color base:",
    'answer' : ['black', 'white', 'colored']},
    {'question' : "Select details:",
    'answer' : ['earings', 'rings', 'belt', 'hat']},
  ];

  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Clothes"),
        ),
        body: Column(
          children: [
            ClothesQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
              return ClothesAnswer(_ButtonTapped, answer);
            }),
          ],
        ),
      )
    );
  }
}

