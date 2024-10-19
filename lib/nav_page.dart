import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/add_page/presentation/add_page.dart';
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';

import 'feature/home/presentation/screens/home.dart';

class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  List<Widget> pageList = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PersistentTabView(
      backgroundColor: AppColors.lemon,
      context,
      screens: [
        Home(),
        AddPage(),
        FProfileScreen()
        // Equalizer(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.navy_blue,
          ),
          inactiveIcon: Icon(
            Icons.home_outlined,
            color: Colors.grey,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.navy_blue,
          icon: Icon(
            Icons.add,
            color: AppColors.navy_blue,
          ),
          inactiveIcon: CircleAvatar(
            radius: 35,
            child: Icon(
              Icons.add,
              color: Colors.grey,
            ),
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.navy_blue,
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          inactiveIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
      ],
      navBarStyle: NavBarStyle.style15,
    );
  }
}
