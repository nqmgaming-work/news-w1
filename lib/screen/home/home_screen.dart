import 'package:first_pj/core/common/custom_appbar.dart';
import 'package:first_pj/screen/home/widget/carousel.dart';
import 'package:first_pj/screen/home/widget/category_list.dart';
import 'package:first_pj/screen/home/widget/future_product.dart';
import 'package:first_pj/screen/home/widget/recommended_product.dart';
import 'package:first_pj/screen/home/widget/title-text.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Category list
            CategoryList(),
            const Carousel(),
            TitleText(
              title: 'Feature Products',
              onTap: () {},
            ),
            FutureProduct(),
            Image.asset('assets/images/banner.png'),
            TitleText(
              title: 'Recommended',
              onTap: () {},
            ),
            RecommendedProduct(),
            TitleText(
              title: 'Top Collection',
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.asset('assets/images/collection1.png'),
                  Image.asset('assets/images/collection2.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Row(
                      children: [
                        Image.asset('assets/images/collection3.png'),
                        const Spacer(),
                        Image.asset('assets/images/collection4.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
