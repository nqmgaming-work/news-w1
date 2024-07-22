import 'package:first_pj/data/model/clock_timer.dart';
import 'package:first_pj/screen/cities/widget/clock_city.dart';
import 'package:flutter/material.dart';

class CitiesScreen extends StatelessWidget {
  CitiesScreen({super.key, required this.backgroundImage});

  final _listCities = ClockTimer.list;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cities'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage), // Replace with your image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Center(
            child: ListView.builder(
              itemCount: _listCities.length,
              itemBuilder: (context, index) {
                final city = _listCities[index];
                return ClockCity(clockTimer: city);
              },
            ),
          ),
        ));
  }
}
