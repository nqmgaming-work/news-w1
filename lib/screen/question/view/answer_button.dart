import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
