import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
        fontSize: 50,
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
        height: 1.5,
        locale: Locale('en', 'US'),
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}
