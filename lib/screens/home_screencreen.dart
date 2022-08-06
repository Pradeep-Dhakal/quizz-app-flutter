import 'package:flutter/material.dart';
import 'package:quizzapp/components/gradient_box.dart';
import 'package:quizzapp/screens/quiz_screen.dart';
import 'package:quizzapp/models/question.dart';

import '../components/action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: GradientBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My Quizz App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            // aba euta Elevated button banauna lageko name 'staty'
            SizedBox(
                height:
                    40), // yo size box chai tyo button ra mathi ko quizz app lekhya thau ma space rakhna

            ActionButton(
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
              title: 'Start',
            ),
          ],
        ),
      ),
    ));
  }
}
