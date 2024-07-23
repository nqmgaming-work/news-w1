import 'package:first_pj/screen/home/widget/category_icon.dart';
import 'package:flutter/material.dart';

import '../../../data/model/category.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final List<Category> categories = Category.categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: CategoryIcon(
                  iconData: categories[index].icon,
                  categoryName: categories[index].categoryName,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
