import 'package:first_pj/screen/themes/widget/theme_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/theme.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen(
      {super.key, required this.backgroundImage, required this.onCardTap});

  final String backgroundImage;
  final Function(String) onCardTap;

  @override
  State<ThemesScreen> createState() {
    return _ThemesScreen();
  }
}

class _ThemesScreen extends State<ThemesScreen> {
  final listThemes = ThemeCard.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.backgroundImage),
            // Replace with your image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4),
                itemCount: listThemes.length,
                itemBuilder: (context, index) {
                  final theme = listThemes[index];
                  return ThemeCards(
                    themeCard: theme,
                    onCardTap: widget.onCardTap,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
