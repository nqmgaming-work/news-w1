import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollState();
  }
}

class _DiceRollState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  late String _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _formatDateTime(DateTime.now());
      });
    });
  }

  void rollDice() {
    setState(() {
      currentDiceRoll = random.nextInt(6) + 1;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/dice-$currentDiceRoll.png",
          width: 200,
        ),
        const SizedBox(height: 20),
        Text(
          _currentTime,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28)),
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
