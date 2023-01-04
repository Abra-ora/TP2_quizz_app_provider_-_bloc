// import 'package:quizz_app_using_privider/data/quizz_questions.dart';

// import '../model/question.dart';

// class QuizzService {
 
//   final QuizzQuestions _quizzQuestions = QuizzQuestions();

//   int totoalQuestions = _quizzQuestions.questions.length;

//   int get questionsLength => questions.length;

//   int _currentQuestionIndex = 0;

//   int get currentQuestionIndex => _currentQuestionIndex;

//   Question getCurrentQuestion() => questions[_currentQuestionIndex];

//   indexLessThanLength() => _currentQuestionIndex < questions.length - 1;

//   Question get nextQuestion {
//     _currentQuestionIndex++;
//     if (_currentQuestionIndex >= questions.length) reset();
//     return questions[_currentQuestionIndex];
//   }


//   answerIsCorrect(bool answer) {
//           return getCurrentQuestion().questionAnswer == answer;
//   }

//   void reset() {
//     _currentQuestionIndex = 0;
//   }
// }
