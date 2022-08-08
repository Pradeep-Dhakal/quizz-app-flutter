import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzapp/components/gradient_box.dart';
import 'package:quizzapp/providers/quiz_provider.dart';
import 'package:quizzapp/screens/quiz_screen.dart';
import 'package:quizzapp/models/question.dart';

import '../components/action_button.dart';
import '../components/rank_auth_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'हाजिर जवाफ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 40),
              if (provider.questions.isEmpty || provider.totalTime == 0)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                ActionButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          totalTime: provider.totalTime,
                          questions: provider.questions,
                        ),
                      ),
                    );
                  },
                  title: 'Start',
                ),
              const SizedBox(height: 20),
              Text(
                'Total Questions: ${provider.questions.length}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 70),
              const RankAuthButton()
            ],
          ),
        ),
      ),
    );
  }
}
