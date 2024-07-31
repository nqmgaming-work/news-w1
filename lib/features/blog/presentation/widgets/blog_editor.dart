import 'package:flutter/material.dart';

class BlogEditor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isTitle;

  const BlogEditor({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isTitle ,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      maxLines: isTitle ? 1 : null,
      maxLength: isTitle ? 50 : 5500,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter some text';
        }
        if (isTitle && value.length > 50) {
          return 'Title should be less than 50 characters';
        }
        if (!isTitle && value.length > 5500) {
          return 'Content should be less than 5500 characters';
        }
        return null;
      },
    );
  }
}
