import 'package:flutter/material.dart';
import '../util/logger.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple]),
        ),
        child: Center(
          child: Column(
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
              const Text(
                "Learn Flutter the fun way!",
                style: TextStyle(
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
          ),
        ),
      ),
    );
  }
}
