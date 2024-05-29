import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:coffee_shop/Screens/cartscreen.dart';
import 'package:coffee_shop/Screens/favouritescreen.dart';
import 'package:coffee_shop/Screens/onboarding.dart';
import 'package:coffee_shop/Screens/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    OnBoardingScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              iconTheme: MaterialStateProperty.all(
                const IconThemeData(
                  size: 30,
                  color: Colors.black87
                ),
              ),
            ),
            child: NavigationBar(
              height: 90,
              animationDuration: const Duration(
                milliseconds: 500,
              ),
              elevation: 0,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    BootstrapIcons.house,
                    ),
                  selectedIcon: Icon(
                    BootstrapIcons.house_fill,
                    color: Color(0xFFD6975D),
                    ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    BootstrapIcons.heart,
                    ),
                  selectedIcon: Icon(
                    BootstrapIcons.heart_fill,
                    color: Color(0xFFD6975D),
                    ),
                  label: 'Favorites',
                ),
                NavigationDestination(
                  icon: Icon(
                    BootstrapIcons.cart,
                    ),
                  selectedIcon: Icon(
                    BootstrapIcons.cart_fill,
                    color: Color(0xFFD6975D),
                    ),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(
                    BootstrapIcons.person_circle,
                  ),
                  selectedIcon: Icon(
                    BootstrapIcons.person_circle,
                    color: Color(0xFFD6975D),
                    ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
