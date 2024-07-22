import 'package:first_pj/screen/cities/cities_screen.dart';
import 'package:first_pj/screen/themes/themes_screen.dart';
import 'package:flutter/material.dart';

import '../clock/clock_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String backgroundImage = "assets/images/bg1.jpeg"; // Default background image

  void changeBackground(String imagePath) {
    setState(() {
      print(imagePath);
      backgroundImage = imagePath;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize _widgetOptions here to ensure it uses the updated backgroundImage
    List<Widget> widgetOptions = [
      ClockScreen(
        backgroundImage: backgroundImage,
      ),
      CitiesScreen(
        backgroundImage: backgroundImage,
      ),
      ThemesScreen(
        backgroundImage: backgroundImage,
        onCardTap: changeBackground,
      ),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Clock',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city),
              label: 'Cities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens),
              label: 'Themes',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              // Replace with your image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          child: Center(
            child: widgetOptions.elementAt(_selectedIndex),
          ),
        ));
  }
}
