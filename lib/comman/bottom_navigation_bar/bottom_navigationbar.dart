import 'package:flutter/material.dart';
import 'package:quest_signin_dashboard/comman/responsive/responsive.dart';
import 'package:quest_signin_dashboard/core/config/app_color.dart';
import 'package:quest_signin_dashboard/core/config/app_textstyle.dart';
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
      body: Row(
        children: [
          if (!Responsive.isMobile(context))
            NavigationRail(
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10)),
                NavigationRailDestination(
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                    padding: EdgeInsets.all(10)),
                NavigationRailDestination(
                    icon: Icon(Icons.help_outline),
                    label: Text('Help'),
                    padding: EdgeInsets.all(10)),
                NavigationRailDestination(
                    icon: Icon(Icons.menu),
                    label: Text('More'),
                    padding: EdgeInsets.all(10)),
              ],
              selectedIndex: _selectedIndex,
              backgroundColor: AppColor.primaryColor,
              selectedIconTheme:
                  const IconThemeData(color: AppColor.whiteColor),
              unselectedIconTheme:
                  const IconThemeData(color: AppColor.whiteColor),
              indicatorColor: AppColor.whiteColor.withOpacity(0.2),
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: AppTextStyle.smallRegularBodyStyle
                  .copyWith(color: AppColor.whiteColor),
              unselectedLabelTextStyle: AppTextStyle.smallRegularBodyStyle
                  .copyWith(color: AppColor.whiteColor),
            ),
          Expanded(child: _widgetOptions[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.primaryColor,
              selectedItemColor: AppColor.whiteColor,
              unselectedItemColor: AppColor.whiteColor,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.help_outline), label: 'Help'),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More')
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedFontSize: 12,
              unselectedFontSize: 12,
            )
          : null,
    );
  }
}
