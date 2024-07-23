import 'package:first_pj/screen/cart/cart_screen.dart';
import 'package:first_pj/screen/home/home_screen.dart';
import 'package:first_pj/screen/profile/profile_screen.dart';
import 'package:first_pj/screen/search/search_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
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
      const HomeScreen(),
      const SearchScreen(),
      const CartScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Material(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                side: BorderSide(color: Colors.grey),
              ),
              child: BottomNavigationBar(
                landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_2),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey[400],
                onTap: _onItemTapped,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 25,
              ),
            ),
          ),
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
