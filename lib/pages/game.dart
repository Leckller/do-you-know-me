import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/questionnaire.dart';

class GameState extends State<Game> {
  int currentQuestion = 0;

  Map<int, Object> questions = {
    0: {
      'question': 'Qual a minha cor favorita?',
      'answers': [
        {'answer': 'Verde', 'score': 3},
        {'answer': 'Azul', 'score': 1},
        {'answer': 'Preto', 'score': 2},
        {'answer': 'Branco', 'score': 0},
      ],
    },
    1: {
      'question': 'Qual o meu animal favorito?',
      'answers': [
        {'answer': 'Gato', 'score': 3},
        {'answer': 'Cachorro', 'score': 2},
        {'answer': 'Pato', 'score': 1},
        {'answer': 'Tubarão', 'score': 0},
      ],
    },
    2: {
      'question': 'Se eu pudesse escolher o nome da minha filha qual seria?',
      'answers': [
        {'answer': 'Chloe', 'score': 3},
        {'answer': 'Diana', 'score': 1},
        {'answer': 'Marina', 'score': 2},
        {'answer': 'Maria', 'score': 0},
      ],
    },
    3: {
      'question': 'Qual é o meu jogo favorito?',
      'answers': [
        {'answer': 'Minecraft', 'score': 2},
        {'answer': 'Remains of edith finch', 'score': 3},
        {'answer': 'Fortnite', 'score': 1},
        {'answer': 'FIFA', 'score': 0},
      ],
    },
    4: {
      'question': 'Qual é a minha música favorita?',
      'answers': [
        {'answer': 'Apocalypse - Cigarettes After Sex', 'score': 1},
        {'answer': 'Starting over - LSD and the Search for God', 'score': 3},
        {'answer': 'Chamber Of Reflection - Mac DeMarco', 'score': 2},
        {'answer': "I Didn't Change My Number - Billie Eilish", 'score': 1},
      ],
    },
    5: {
      'question': 'Qual é o meu cantor(a) favorito(a)?',
      'answers': [
        {'answer': 'Laufey', 'score': 0},
        {'answer': 'Matuê', 'score': 1},
        {'answer': 'Mac DeMarco', 'score': 3},
        {'answer': "Billie Eilish", 'score': 2},
      ],
    },
    6: {
      'question': 'Qual a minha fruta favorita?',
      'answers': [
        {'answer': 'Banana madura', 'score': 0},
        {'answer': 'Maçã', 'score': 2},
        {'answer': 'Uva', 'score': 1},
        {'answer': "Abacaxi", 'score': 3},
      ],
    },
    7: {
      'question': 'Qual é o meu dia da semana favorito?',
      'answers': [
        {'answer': 'Segunda', 'score': 0},
        {'answer': 'Quinta', 'score': 2},
        {'answer': 'Terça', 'score': 1},
        {'answer': "Quarta", 'score': 3},
      ],
    },
    8: {
      'question': 'Qual é a minha banda de rock favorita?',
      'answers': [
        {'answer': 'Alice In Chains', 'score': 0},
        {'answer': 'Slipknot', 'score': 2},
        {'answer': 'Deftones', 'score': 1},
        {'answer': 'My Chemical Romance', 'score': 3},
      ],
    },
    9: {
      'question': 'Qual é a minha série favorita?',
      'answers': [
        {'answer': 'The mentalist', 'score': 0},
        {'answer': 'Dark', 'score': 2},
        {'answer': 'You', 'score': 1},
        {'answer': 'House, M.D', 'score': 3},
      ],
    },
    10: {
      'question': 'Qual é o meu anime favorito?',
      'answers': [
        {'answer': 'Bleach', 'score': 0},
        {'answer': 'Jujustu Kaisen', 'score': 2},
        {'answer': 'Hellsing', 'score': 1},
        {'answer': 'My Hero Academia', 'score': 3},
      ],
    },
    11: {
      'question': 'Qual é o desenho favorito da cartoon network?',
      'answers': [
        {'answer': 'Clarêncio o otimista', 'score': 0},
        {'answer': 'Apenas um show', 'score': 2},
        {'answer': 'Steven universo', 'score': 1},
        {'answer': 'Hora de aventura', 'score': 3},
      ],
    },
    12: {
      'question': 'Qual é o desenho favorito da nickelodeon?',
      'answers': [
        {'answer': 'Bob esponja', 'score': 0},
        {'answer': 'phineas e ferb', 'score': 2},
        {'answer': 'The loud house', 'score': 1},
        {'answer': 'Padrinhos mágicos', 'score': 3},
      ],
    },
    13: {
      'question': 'Qual lugar eu gostaria de morar?',
      'answers': [
        {'answer': 'São paulo', 'score': 0},
        {'answer': 'Icaraí', 'score': 2},
        {'answer': 'Rio de janeiro', 'score': 1},
        {'answer': 'Petrópolis', 'score': 3},
      ],
    },
  };

  void nextQuestion(dynamic answer) {
    widget.userScore.add(answer['score']);
    if (currentQuestion < (questions.length - 1)) {
      setState(() {
        currentQuestion++;
      });
    } else {
      widget.changePage('result');
    }
  }

  void goBack() {
    if (currentQuestion > 0) {
      widget.userScore.removeLast();
      setState(() {
        currentQuestion--;
      });
    } else {
      widget.changePage('start');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestionData =
        questions[currentQuestion] as Map<String, dynamic>?;
    final answers = currentQuestionData?['answers'] as List<dynamic>? ?? [];
    return Column(
      children: [
        BackButton(onPressed: goBack),
        Questionnaire(
          question: currentQuestionData?['question'],
          answers: answers,
          onPressed: nextQuestion,
        ),
      ],
    );
  }
}

class Game extends StatefulWidget {
  final Function changePage;
  final List<num> userScore;
  const Game({super.key, required this.changePage, required this.userScore});

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}
