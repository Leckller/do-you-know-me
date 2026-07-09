import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/questionnaire.dart';

class GameState extends State<Game> {
  int currentQuestion = 0;

  num userScore = 0;

  Map<int, Object> questions = {
    0: {
      'question': 'Qual a minha cor favorita?',
      'answers': [
        {
          'answer': 'Verde',
          'score':1
        },
        {
          'answer': 'Azul',
          'score':1
        },
        {
          'answer': 'Preto',
          'score':1
        },
      ],
    },
    1: {
      'question': 'Qual o meu animal favorito?',
      'answers': [
        {
          'answer': 'Gato',
          'score':1
        },
        {
          'answer': 'Cachorro',
          'score':1
        },
        {
          'answer': 'Pato',
          'score':1
        },
      ],
    },
    2: {
      'question': 'Se eu pudesse escolher o nome da minha filha qual seria?',
      'answers': [
        {
          'answer': 'Chloe',
          'score':1
        },
        {
          'answer': 'Diana',
          'score':1
        },
        {
          'answer': 'Marina',
          'score':1
        },
      ],
    },
  };

  void nextQuestion(dynamic answer) {
    if (currentQuestion < (questions.length - 1)) {
      userScore += answer['score'];
      setState(() {
        currentQuestion++;
      });
    } else {
      widget.changePage('result');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestionData =
        questions[currentQuestion] as Map<String, dynamic>?;
    final answers = currentQuestionData?['answers'] as List<dynamic>? ?? [];
    return Container(
      child: Questionnaire(
        question: currentQuestionData?['question'],
        answers: answers,
        onPressed: nextQuestion,
      ),
    );
  }
}

class Game extends StatefulWidget {
  final Function changePage;
  const Game({super.key, required this.changePage});

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}
