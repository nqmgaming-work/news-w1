import 'package:first_pj/constants/font_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatefulWidget {
  final IconData iconData;
  final String categoryName;

  const CategoryIcon({
    super.key,
    required this.iconData,
    required this.categoryName,
  });

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Column(
        children: [
          Container(
            height: 53,
            width: 53,
            // if selected show border
            decoration: BoxDecoration(
              color: _isSelected
                  ? const Color.fromRGBO(255, 255, 255, 1)
                  : const Color.fromRGBO(243, 243, 243, 1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: _isSelected
                    ? const Color.fromRGBO(58, 44, 39, 1)
                    : const Color.fromRGBO(243, 243, 243, 1),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: _isSelected
                      ? const Color.fromRGBO(58, 44, 39, 1)
                      : const Color.fromRGBO(243, 243, 243, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(widget.iconData,
                    size: 30,
                    color: _isSelected
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(157, 157, 157, 1)),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(widget.categoryName,
              style: TextStyle(
                  fontFamily: FontConstants.productSans,
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: _isSelected
                      ? const Color.fromRGBO(58, 44, 39, 1)
                      : const Color.fromRGBO(157, 157, 157, 1))),
        ],
      ),
    );
  }
}
