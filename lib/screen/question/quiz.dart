import 'package:first_pj/data/questions.dart';
import 'package:first_pj/screen/question/questions_screen.dart';
import 'package:first_pj/screen/result/result_screen.dart';
import 'package:first_pj/screen/start/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  String activeScreen = "StartScreen";
  final List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length - 1) {
      setState(() {
        activeScreen = "ResultScreen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = "QuestionsScreen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "QuestionsScreen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "ResultScreen") {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers);
    } else {
      screenWidget = StartScreen(switchScreen);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple])),
        child: Center(
          child: screenWidget,
        ),
      ),
    );
  }
}
