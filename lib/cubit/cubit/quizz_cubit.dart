import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/quizz_questions.dart';
import '../../model/question.dart';

part 'quizz_state.dart';

class QuizzCubit extends Cubit<QuizzCubitInitial> {
  QuizzCubit() : super(QuizzCubitInitial(0, 0, []));

  int _score = 0;
  int _currentQuestionIndex = 0;
  List<Icon> scoreKeeper = [];

  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;

  void nextQuestion(bool answer) {
    _currentQuestionIndex++;
    if (answerIsCorrect(answer)) _score += 10;
    addIconToScorKeeper(answer);
    emit(QuizzCubitInitial(_currentQuestionIndex, _score, scoreKeeper));
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
    scoreKeeper = [];
    emit(QuizzCubitInitial(_currentQuestionIndex, _score, scoreKeeper));
  }

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
}
