import 'package:flutter/material.dart';

class Category {
  final int id;
  final String categoryName;
  final IconData icon;

  Category({
    required this.id,
    required this.categoryName,
    required this.icon,
  });

  static List<Category> categories = [
    Category(id: 1, categoryName: 'Woman', icon: Icons.female),
    Category(id: 2, categoryName: 'Men', icon: Icons.male),
    Category(id: 3, categoryName: 'Accessories', icon: Icons.accessibility),
    Category(id: 4, categoryName: 'Beauty', icon: Icons.face),
  ];
}
