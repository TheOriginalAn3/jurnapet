import 'package:flutter/material.dart';

import 'package:jurnapet/pages/home_page.dart';
import 'package:jurnapet/pages/profile_page.dart';
import 'package:jurnapet/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Pages
  int _currentPageIndex = 0;

  final List _pages = [HomePage(), SettingsPage()];

  void _onNavBarItemTapped(int index) {
    if (index > _pages.length || index < 0) {
      throw Exception('Index out of bounds');
    }

    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 32,
            // On Pressed, open the Profile Page
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _onNavBarItemTapped,
        items: [
          // Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
