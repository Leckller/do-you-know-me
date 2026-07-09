import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/game.dart';
import 'package:projeto_perguntas/pages/result.dart';
import 'package:projeto_perguntas/pages/start.dart';

void main() => runApp(ProjetoPerguntasApp());

class ProjetoPerguntasAppState extends State<ProjetoPerguntasApp> {

  late final Map<String, Widget> pages;

  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = {
      'start': Start(changePage: changePage,),
      'game': Game(changePage: changePage),
      'result' : Result(changePage: changePage)
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
