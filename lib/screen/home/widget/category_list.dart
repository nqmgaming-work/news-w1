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
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemBuilder: (context, index) {
                  final double rightPadding = index == categories.length - 1 ? 15.0 : 0.0;
                  return Padding(
                    padding: EdgeInsets.only(left: 28.0, right: rightPadding),
                    child: CategoryIcon(
                      iconData: categories[index].icon,
                      categoryName: categories[index].categoryName,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}