import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/logger.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            scale: 0.5,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.eduNswActFoundation(
              color: Colors.white,
              fontSize: 18 /**/,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          onPressed: () {
            logger.i("Button pressed");
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              width: 2.0,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  offset: Offset(3, 3),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
