import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_using_privider/data/quizz_questions.dart';

import '../provider/quizz_provider.dart';


class QuizzResult extends StatefulWidget{
  int score = 0;
  int total = QuizzQuestions.questions.length * 10;
  // final Function reset;

  QuizzResult({super.key, required this.score});

  @override
  _QuizzResultState createState() => _QuizzResultState();
}

class _QuizzResultState extends State<QuizzResult> {
  
  String mention = "";
  @override
  void initState() {
    super.initState();
        var percentage = widget.score/widget.total * 100;
        if (percentage >= 90) {
          mention = "Excellent";
        } else if (percentage >= 80 && percentage < 90) {
          mention = "Très bien";
        } else if (percentage >= 60 && percentage < 80) {
          mention = "Bien";
        } else if (percentage < 60) {
          mention = "Perseverer!";
        }
  }

  @override
  Widget build(BuildContext context) {
    final _quizzProvider = Provider.of<QuizzProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Résultat"),
        backgroundColor: Colors.grey[850],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Votre score est : ${widget.score}/${widget.total} : $mention",
              style: const TextStyle(fontSize: 24,),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                backgroundColor: Colors.grey[850],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                _quizzProvider.reset();
                Navigator.pop(context);
              },
              
              child: const Text(
                "Recommencer",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
