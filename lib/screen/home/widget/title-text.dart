import 'package:flutter/material.dart';

import '../../../constants/font_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: FontConstants.productSans,
                color: Colors.black),
          ),
          TextButton(
            onPressed: () {
              onTap();
            },
            child: const Text(
              'Show all',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: FontConstants.productSans,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}