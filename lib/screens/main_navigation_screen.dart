import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'hire_screen.dart'; // Hire screen is the 'Search' tab
import 'apply_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0; // Default to Home tab

  // List of widgets to display for each tab.
  // These should be the main screen widgets for each tab.
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HireScreen(), // 'Search' tab is implemented by HireScreen
    ApplyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar for each screen is defined within the respective screen files (HomeScreen, HireScreen, ApplyScreen).
      // This allows each screen to customize its AppBar (e.g., actions, title).
      // If a global AppBar was desired for all tabs, it would be placed here.
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search', // This is the Hire page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in_outlined),
            activeIcon: Icon(Icons.assignment_turned_in),
            label: 'Apply',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Theme colors are applied via AppTheme's bottomNavigationBarTheme
      ),
    );
  }
}