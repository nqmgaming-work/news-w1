import 'package:first_pj/core/common/custom_appbar.dart';
import 'package:first_pj/screen/home/widget/carousel.dart';
import 'package:first_pj/screen/home/widget/category_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Gemstore",
        leadingIcon: Icons.menu,
        actionIcons: [
          IconButton(
            onPressed: () {
              // Handle notification icon tap
            },
            icon: Stack(
              clipBehavior: Clip.none, // Allow overflow
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 30,
                ),
                // Notification icon
                Positioned(
                  // Red dot
                  right: -3,
                  top: -3,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body:  Column(
        children: [
          // Category list
          CategoryList(),
          Carousel(),
        ],
      ),
    );
  }
}
