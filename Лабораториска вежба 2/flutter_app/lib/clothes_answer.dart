import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget{

  String _answerText = "";
  VoidCallback tapped;
  ClothesAnswer(this.tapped, this._answerText);

  @override
  Widget build(BuildContext context){
    return  Container(
      margin: EdgeInsets.all(5),
      child:  ElevatedButton(
              onPressed: tapped,
              child: Text(
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.red,
                  ),
                _answerText),
                style: ElevatedButton.styleFrom( 
                  primary: Colors.green
                  ),
              )
    );
  
  }
}