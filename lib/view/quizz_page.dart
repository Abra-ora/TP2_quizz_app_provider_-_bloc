import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_using_privider/cubit/cubit/quizz_cubit.dart';
import 'result.dart';
import 'package:cached_network_image/cached_network_image.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {

    final _quizzCubit = Provider.of<QuizzCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizz : questions et réponses"),
        backgroundColor: Colors.grey[850],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // child: Row(
                  children: [
                    Text(
                      _quizzCubit.getCurrentQuestion().questionText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CachedNetworkImage(
                      imageUrl:
                          _quizzCubit.getCurrentQuestion().questionImage,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width - 12,
                      height: MediaQuery.of(context).size.height / 2.2,
                    ),
                  ],
                  //  )
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text(
                  'Vrai',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  if(_quizzCubit.indexLessThanLength()){
                    _quizzCubit.nextQuestion(true);
                  }else{
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizzResult(score: _quizzCubit.score)));
                  }

                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'Faux',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  if(_quizzCubit.indexLessThanLength()){
                    _quizzCubit.nextQuestion(false);
                    print(_quizzCubit.score);
                  }else{
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizzResult(score: _quizzCubit.score)));
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _quizzCubit.scoreKeeper,
          ),
        ],
      ),
    );
  }
}
