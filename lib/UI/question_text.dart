import 'package:flutter/material.dart';

// Returns a material of text with question

class QuestionText extends StatefulWidget {
  final String _question;

  QuestionText(this._question);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new Text(
        widget._question,
          style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      )
    );
  }
}