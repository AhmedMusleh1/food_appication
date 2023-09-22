import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/pages/favorites.dart';
import 'package:food_application/pages/home-page.dart';
import 'package:food_application/pages/profile.dart';

class FoodBottomNavBar extends StatefulWidget {
  const FoodBottomNavBar({super.key});

  @override
  State<FoodBottomNavBar> createState() => _FoodBottomNavBarState();
}

class _FoodBottomNavBarState extends State<FoodBottomNavBar> {
  int selectedIndex = 0;

  List<Widget> widgetBuilder = const [
    HomePage(),
    FavoritePage(),
    ProfilePage()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: widgetBuilder[selectedIndex],
        bottomNavigationBar: adaptiveNavigationBar(size, orientation));
  }

  Widget? adaptiveNavigationBar(Size size, Orientation orientation) {
    if (size.width > 800 && orientation != Orientation.landscape) {
      return null;
    } else if (Platform.isIOS) {
      return CupertinoTabBar(
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "profile"),
          ]);
    } else {
      return BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "favorite"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "profile"),
        ],
      );
    }
  }
}
