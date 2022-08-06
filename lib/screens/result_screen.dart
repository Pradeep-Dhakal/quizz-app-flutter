import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizzapp/components/action_button.dart';
import 'package:quizzapp/components/gradient_box.dart';
import 'package:quizzapp/models/question.dart';
import 'package:quizzapp/screens/quiz_screen.dart';
import '../components/action_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.score, required this.totalQuestions})
      : super(key: key);
  final int score;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Result: $score/$totalQuestions",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(
              height: 40,
            ),
            ActionButton(
              title: "play Again",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      totalTime: 10,
                      questions: question,
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
