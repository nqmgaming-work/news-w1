import 'package:first_pj/dice_roll.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.bottomRight;
const endAlignment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
