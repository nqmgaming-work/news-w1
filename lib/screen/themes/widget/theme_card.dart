import 'package:first_pj/data/model/theme.dart';
import 'package:flutter/material.dart';

class ThemeCards extends StatefulWidget {
  final ThemeCard themeCard;
  final Function(String) onCardTap;

  const ThemeCards(
      {super.key, required this.themeCard, required this.onCardTap});

  @override
  State<ThemeCards> createState() {
    return _ThemeCardState();
  }
}

class _ThemeCardState extends State<ThemeCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onCardTap(widget.themeCard.image);
      },
      child: Card(
        elevation: 6,
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Image.asset(
              widget.themeCard.image,
              fit: BoxFit.cover,
            )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.themeCard.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
