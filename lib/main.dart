import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/game.dart';
import 'package:projeto_perguntas/pages/result.dart';
import 'package:projeto_perguntas/pages/start.dart';

void main() => runApp(ProjetoPerguntasApp());

class ProjetoPerguntasAppState extends State<ProjetoPerguntasApp> {
  late final Map<String, Widget> pages;

  late Widget currentPage;

  List<num> userScore = [];

  @override
  void initState() {
    super.initState();
    pages = {
      'start': Start(changePage: changePage, userScore: userScore),
      'game': Game(changePage: changePage, userScore: userScore),
      'result': Result(changePage: changePage, userScore: userScore),
    };
    currentPage = pages['start']!;
  }

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
        body: currentPage,
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
