import 'package:flutter/material.dart';
import 'package:quizz_app_using_privider/data/quizz_questions.dart';
import 'package:quizz_app_using_privider/model/question.dart';

class QuizzProvider extends ChangeNotifier {
  int _score = 0;

  int _currentQuestionIndex = 0;

  List<Icon> scoreKeeper = [];

  int get score => _score;

  int get currentQuestionIndex => _currentQuestionIndex;

  indexLessThanLength() =>
      _currentQuestionIndex < QuizzQuestions.questions.length - 1;

  Question getCurrentQuestion() =>
      QuizzQuestions.questions[_currentQuestionIndex];

  answerIsCorrect(bool answer) {
    return getCurrentQuestion().questionAnswer == answer;
  }

  void addIconToScorKeeper(bool answer) {
    if (answerIsCorrect(answer)) {
      scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
    }
  }

  nextQuestion(bool answer) {
    _currentQuestionIndex++;
    if (answerIsCorrect(answer)) _score += 10;
    addIconToScorKeeper(answer);
    notifyListeners();
  }

  reset() {
    _currentQuestionIndex = 0;
    _score = 0;
    scoreKeeper = [];
    notifyListeners();
  }
}
