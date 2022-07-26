import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizzapp/components/gradient_box.dart';
import 'package:quizzapp/models/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.totalTime, required this.questions})
      : super(key: key);
  final int totalTime;
  final List<Question> questions;
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int _currentTime;
  late Timer _timer;
  int _currentindex = 0;
  String _selectedAnswer = '';
  @override
  void initState() {
    super.initState();
    _currentTime = widget.totalTime;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime -= 1;
      });
      if (_currentTime == 0) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currnetQuestion = widget.questions[_currentindex];
    return Scaffold(
      body: GradientBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              SizedBox(
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      LinearProgressIndicator(
                        value: _currentTime / widget.totalTime,
                      ),
                      Center(
                        child: Text("${_currentTime.toString()} सेकेन्ड बाँकि ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Question',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                currnetQuestion.question,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final answer = currnetQuestion.answers[index];
                    return Card(
                      color: _selectedAnswer == answer &&
                              answer == currnetQuestion.correctAnswer
                          ? Colors.green
                          : null,
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            _selectedAnswer = answer;
                          });
                        },
                        title: Text(
                          answer,
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    );
                  },
                  itemCount: currnetQuestion.answers.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
