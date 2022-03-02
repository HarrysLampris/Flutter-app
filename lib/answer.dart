import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function
      selectHandler; //εδω περναει ο pointer για την συναρτηση στην main.dart
  final String answerText; // εδω περναει το κειμενο καθε απαντησης
  Answer(this.selectHandler, this.answerText); //o constructor για το answer

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // το χρησιμοποιουμε για να πουμε στον container να πιασει ολο το width που βρισκει
      child: RaisedButton(
          child: Text(answerText),
          onPressed:
              selectHandler, //ο Pointer της συναρτησης στην main που αυξανει το index
          color: Colors.blue),
    );
  }
}
