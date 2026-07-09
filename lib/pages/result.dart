import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function changePage;
  final List<num> userScore;

  const Result({super.key, required this.changePage, required this.userScore});

  void restart() {
    changePage('start');
  }

  num totalPoints() {
    return userScore.reduce((value, element) => value + element);
  }

  String message() {
    return totalPoints() <= userScore.length
        ? "Você respondeu foi no chute, né?"
        : totalPoints() <= userScore.length * 2
        ? "Foi na força da amizade. 🤝"
        : totalPoints() < userScore.length * 3
        ? "Brabo! Seu cérebro resolveu trabalhar hoje. 🧠"
        : "Gabaritou! Tá me stalkeando faz quanto tempo? 🤨";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
        child: Column(
          children: [
            Text("Sua pontuação foi:", style: TextStyle(fontSize: 48.0)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    totalPoints().toString(),
                    style: TextStyle(
                      fontSize: 120.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    message(),
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8.0,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: restart,
                      child: Text("Tente mais uma vez!"),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Legal! Tchau."),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
