part of 'quizz_cubit.dart';


class QuizzCubitInitial {
  int _score;
  int _currentQuestionIndex;
  List<Icon> scoreKeeper;
  
  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;

  QuizzCubitInitial(this._currentQuestionIndex, this._score, this.scoreKeeper);
}
