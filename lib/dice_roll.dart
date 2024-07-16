import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollState();
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

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void rollDice() {
    setState(() {
      currentDiceRoll = random.nextInt(6) + 1;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DiceImage(currentDiceRoll: currentDiceRoll),
        const SizedBox(height: 20),
        CurrentTimeText(currentTime: _currentTime),
        const SizedBox(height: 20),
        RollDiceButton(onPressed: rollDice),
      ],
    );
  }
}

class DiceImage extends StatelessWidget {
  final int currentDiceRoll;

  const DiceImage({super.key, required this.currentDiceRoll});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/dice-$currentDiceRoll.png",
      width: 200,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
    );
  }
}

class CurrentTimeText extends StatelessWidget {
  final String currentTime;

  const CurrentTimeText({super.key, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Text(
      currentTime,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class RollDiceButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RollDiceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 28),
      ),
      child: const Text("Roll Dice"),
    );
  }
}
