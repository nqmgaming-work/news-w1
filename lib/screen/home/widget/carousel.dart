import 'package:card_swiper/card_swiper.dart';
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
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
