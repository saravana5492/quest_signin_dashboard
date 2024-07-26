import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/features/dashboard/presentation/pages/dashboard_page.dart';

class MainBottomNavigationbar extends StatefulWidget {
  const MainBottomNavigationbar({super.key});

  @override
  State<MainBottomNavigationbar> createState() =>
      _MainBottomNavigationbarState();
}

class _MainBottomNavigationbarState extends State<MainBottomNavigationbar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    DashboardPage(),
    Center(child: Text("Search")),
    Center(child: Text("Help")),
    Center(child: Text("More")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.primaryColor,
        selectedItemColor: AppColor.whiteColor,
        unselectedItemColor: AppColor.whiteColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
