import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function changePage;

  const Result({super.key, required this.changePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Sua pontuação foi:")
        ],
      ),
    );
  }
}
