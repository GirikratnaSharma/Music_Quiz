import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Which band wrote Across the Universe?',
      'answers': [
        {'text': 'Pink Floyd', 'score': -2},
        {'text': 'AC/DC', 'score': -2},
        {'text': 'The Beatles', 'score': 10},
        {'text': 'Nirvana', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Which band wrote Highway to Hell?',
      'answers': [
        {'text': 'Pink Floyd', 'score': -2},
        {'text': 'The Kinks', 'score': -2},
        {'text': 'The Beatles', 'score': -2},
        {'text': 'AC/DC', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Which writer is the best? :)',
      'answers': [
        {'text': 'Paul Mccartney', 'score': -2},
        {'text': 'Roger Waters', 'score': 10},
        {'text': 'David Gilmore', 'score': -2},
        {'text': 'John Lennon', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Which band created Echoes?',
      'answers': [
        {'text': 'Pink Floyd', 'score': 10},
        {'text': 'The Beatles', 'score': -2},
        {'text': 'The Police', 'score': -2},
        {'text': 'Queen', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. Is David Gilmore the best Pink Floyd member? :)',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Music Quiz (by Girik)'),
          backgroundColor: Color(0xFFFF9800),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
