import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/questionnaire.dart';
import 'package:projeto_perguntas/pages/start.dart';

void main() => runApp(ProjetoPerguntasApp());

class ProjetoPerguntasAppState extends State<ProjetoPerguntasApp> {

  final Map<String, Widget> pages = {
    'start': Start(),
    'questionnaire': Questionnaire(),
  };

  Widget currentPage = Start();

  void changePage(String page) {
    setState(() {
      currentPage = pages[page]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Container(
            alignment: AlignmentGeometry.center,
            child: Text(
              "Quanto você me conhece?",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: currentPage),
          ],
        ),
      ),
    );
  }
}

class ProjetoPerguntasApp extends StatefulWidget {
  const ProjetoPerguntasApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProjetoPerguntasAppState();
  }
}
