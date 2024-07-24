import 'package:card_swiper/card_swiper.dart';
import 'package:first_pj/constants/font_constants.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() {
    return _Carousel();
  }
}

class _Carousel extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/carousel1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Autum \nCollection \n2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstants.productSans,
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          },
          itemCount: 3,
          pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10),
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.white,
              size: 8,
              activeSize: 15,
            ),
          ),
          autoplay: false,
          indicatorLayout: PageIndicatorLayout.SCALE,
          itemWidth: 300,
          itemHeight: 200,
          viewportFraction: 0.8,
          scale: 0.9,
          loop: true,
          // change indicator color
        ),
      ),
    );
  }
}
