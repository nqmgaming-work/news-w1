class ThemeCard {
  final String name;
  final String image;

  ThemeCard({required this.name, required this.image});

  static List<ThemeCard> list = [
    ThemeCard(name: 'Risk', image: 'assets/images/bg1.jpeg'),
    ThemeCard(name: 'Luffy', image: 'assets/images/bg2.jpeg'),
    ThemeCard(name: "I don't know", image: 'assets/images/bg3.jpeg'),
    ThemeCard(name: 'Pink panther', image: 'assets/images/bg4.jpeg'),
  ];
}