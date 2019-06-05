// First screen when user opens app
import 'package:flutter/material.dart';
import './quiz_page.dart';

// the background image changes fit when phone changes orientation
BoxFit returnFit(context) {
  if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)
    return BoxFit.fitHeight;
  else {
    return BoxFit.fitWidth;
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueGrey,
      child: new InkWell(
        // click screen to start quiz
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Container(
          // airplane background image
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/b/b5/ANA_B767-381_JA8578_Pokemon-Jet98.jpg"),
              fit: returnFit(context)
            ),
          ),
          // Text in center
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Find next travel destination", textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold)),
              new Text("\nTo play, tap the stars based on how much you agree with the statement.", textAlign: TextAlign.center, style: new TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
              new Text("\nTap to start!", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
            ]
          )
        )
      )
    );
  }
}