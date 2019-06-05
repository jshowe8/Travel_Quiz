import './question.dart';

// keep track of users score for each question and return next question
class Quiz {
  List<Question> _questions;
  int _currQuestionInd = -1;
  List<int> _score = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5];

  Quiz(this._questions);

  // DART GETTER
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNum => _currQuestionInd + 1;
  List<int> get score => _score;

  Question get nextQuestion {
    _currQuestionInd++;
    if (_currQuestionInd >= length) { return null; }
    return _questions[_currQuestionInd];
  }

  // star ratings scale to 1-10
  void answer(int agreeLevel) {
    if (agreeLevel == 2) {
      agreeLevel = 3;
    } else if (agreeLevel == 3) {
      agreeLevel = 5;
    } else if (agreeLevel == 4) {
      agreeLevel = 7;
    } else if (agreeLevel == 5) {
      agreeLevel = 10;
    }
    _score[_currQuestionInd] = agreeLevel;
  }
}
