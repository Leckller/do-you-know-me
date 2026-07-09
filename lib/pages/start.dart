import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_perguntas/pages/questionnaire.dart';

class Start extends StatelessWidget {
  final Function changePage;

  const Start({super.key, required this.changePage});

  void onPressed(dynamic answer) {
    num index = answer['index']; 
    if (index == 0) {
      changePage('game');
    } else {
      SystemNavigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
      child: Questionnaire(
        question: "Olá! Você me conhece?",
        answers: [
          {'answer': 'Sim! Eu acho...', 'index': 0},
          {'answer': 'Não. Tchau!', 'index': 1},
        ],
        onPressed: onPressed,
      ),
    );
  }
}
