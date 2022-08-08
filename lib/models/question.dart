import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Question {
  final String id;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Question copyWith({
    String? id,
    String? question,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'],
    );
  }

  factory Question.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return Question.fromMap(data);
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, question: $question, answers: $answers, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.question == question &&
        listEquals(other.answers, answers) &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        answers.hashCode ^
        correctAnswer.hashCode;
  }
}
  // question ko object hary banako

// List<Question> question = [
//   Question(
//     id: '1',
//     question: 'Which of the following widgets used for repeating the content',
//     answers: ['Expanded', 'ListView', 'Stack', 'Scaffold'],
//     correctAnswer: 'ListView',
//   ),
//   Question(
//     id: '2',
//     question:
//         'What operating systems can you install the Flutter development environment on?',
//     answers: ['Windows', 'Mac', 'Linux', 'All of above'],
//     correctAnswer: 'All of above',
//   ),
//   Question(
//     id: '3',
//     question: 'Which of the following widgets use for layout ?',
//     answers: ['pradeep', 'hari', 'sharad', 'paudel'],
//     correctAnswer: 'pradeep',
//   ),
//   Question(
//     id: '4',
//     question: 'Which of the following widgets use for layout ?',
//     answers: ['Text', 'Column', 'Expanded', 'Inkwell'],
//     correctAnswer: 'Column',
//   ),
//   Question(
//     id: '5',
//     question:
//         'Which of these functions contain the code which houses the widgets of your app?',
//     answers: ['debug()', 'runApp()', 'random()', 'build()'],
//     correctAnswer: 'build()',
//   ),
//   Question(
//     id: '6',
//     question:
//         'Flutter cannot be used to develop apps for which of the following?',
//     answers: ['web', 'Mobile', 'Voice Assistants', 'Desktop'],
//     correctAnswer: 'Voice Assistants',
//   ),
//   Question(
//     id: '7',
//     question: 'What are build modes in flutter?',
//     answers: ['Debug', 'Profile', 'Release', 'All of the Above'],
//     correctAnswer: 'All of the Above',
//   ),
//   Question(
//     id: '8',
//     question: 'What is Flutter?',
//     answers: [
//       'Flutter is used to make desktop apps',
//       'Flutter is a UI toolkit made by Apple',
//       'Flutter is a UI toolkit used for creating high quality apps',
//       'Flutter is the same as Java'
//     ],
//     correctAnswer:
//         'Flutter is a UI toolkit used for creating high quality apps',
//   ),
//   Question(
//     id: '9',
//     question: 'Which company created Dart?',
//     answers: ['Microsoft', 'Twiter', 'Apache', 'Google'],
//     correctAnswer: 'Google',
//   ),
//   Question(
//     id: '10',
//     question: 'Which one of the following is a disadvantage of flutter?',
//     answers: [
//       'Hot Reload',
//       'Hot Restart',
//       'Increase App size',
//       'Increase Productivity'
//     ],
//     correctAnswer: 'Increase App size',
//   ),
// ];
