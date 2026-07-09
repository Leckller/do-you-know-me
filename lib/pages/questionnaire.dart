import 'package:flutter/material.dart';

class Questionnaire extends StatelessWidget {
  final String question;
  final List<dynamic> answers;
  final Function onPressed;

  const Questionnaire({
    super.key,
    required this.question,
    required this.answers,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 56.0, fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8.0,
                children: [
                  ...answers.map(
                    (answer) => SizedBox(
                      width: double.infinity,
                      height: 64.0,
                      child: ElevatedButton(
                        onPressed: () => onPressed(answer),
                        child: Text(
                          answer['answer'],
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
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
