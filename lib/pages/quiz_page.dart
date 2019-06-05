// screen where user inputs how many stars

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/question_text.dart';
import '../UI/question_pic.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  double rating = 0;
  int starCount = 5;

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("has preserved historic buildings."),
    new Question("has modern infrastructure and architecture."),
    new Question("is multicultural."),
    new Question("has outdoor activities."),
    new Question("has many museums."),
    new Question("has plenty of cheap street food."),
    new Question("has a warm climate."),
    new Question("feels generally safe."),
    new Question("has plenty of night life."),
    new Question("has mountains for hiking and sightseeing."),
  ]);
  String questionText;
  int questionNumber;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNum;
  }

  // gathers user input into an array in quiz class and moves to next question
  void handleAnswer(int agreeLevel) {
    quiz.answer(agreeLevel);
    currentQuestion = quiz.nextQuestion;
    if (quiz.questionNum < 11) {
      this.setState(() {
        questionText = currentQuestion.question;
        questionNumber = quiz.questionNum;
      });
    } else {
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score)));
    }
    // reset rating for next question
    this.rating = 0;
  }

  // the background image changes fit when phone changes orientation
  BoxFit returnFit(context) {
    if (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)
      return BoxFit.fitHeight;
    else {
      return BoxFit.fitWidth;
    }
  }

  @override
  Widget build(BuildContext context){
    return new Center(
      // make container size of screen
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: NetworkImage(new QuestionPic(questionNumber).getPicLink()),
            fit: returnFit(context),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            new Container(
                height: MediaQuery.of(context).size.height * 0.25,
                // question text goes at bottom of top 40% of screen, with some
                // space on the sides
                child: new Row(
                  children: <Widget> [
                    new Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    new Expanded(
                      flex: 8,
                        child: Column (
                          children: <Widget> [
                            Expanded(
                              flex: 3,
                              child: new FittedBox(
                                fit: BoxFit.fitWidth,
                                child: new Material(
                                  color: Colors.transparent,
                                  child: new Text("The destination ", style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                )
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: new FittedBox(
                                fit: BoxFit.fitWidth,
                                child: new QuestionText(questionText),
                              ),
                            ),
                          ]
                        ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height * 0.05),
                  ]
                )
            ),
            // space between text and stars is 30% of screen
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            // allow for star rating to be 20% of screen size height. There is
            // 10% of blank screen space left at the bottom.
            // Allow for 1/2 a star size of empty space on either side
            // of the stars
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: new LayoutBuilder(builder: (context, constraint) {
                return new StarRating(
                  size: constraint.biggest.width * (1 / (starCount + 1)),
                  rating: rating,
                  color: Colors.deepOrangeAccent,
                  borderColor: Colors.blueGrey,
                  starCount: starCount,
                  onRatingChanged: (rating) => setState(
                        () {
                      this.rating = rating;
                      // delay 0.35 seconds so user can see the stars they tap
                      Future.delayed(const Duration(milliseconds: 350), ()
                      {
                        handleAnswer(this.rating.round());
                      });
                    },
                  ),
                );
              }),
            )
          ]
        )
      ),
    );
  }
}