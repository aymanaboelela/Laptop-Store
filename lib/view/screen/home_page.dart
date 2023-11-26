import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import '../../core/constant/color.dart';
import 'nav_bar/favorite.dart';
import 'nav_bar/home_product.dart';
import 'nav_bar/notfication.dart';
import 'nav_bar/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.notifications_on_outlined,
    Icons.settings,
  ];
  final List<Widget> classSwitch = [
    const HomeProduct(),
    const FavoritePage(),
    const NotificationPage(),
    const SettingPage(),
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: kBackgroundScreen),
        child: IndexedStack(
          index: _bottomNavIndex,
          children: classSwitch,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: kBlue,
        child: const Icon(Icons.add, size: 35),
        onPressed: () {
          //add rodact;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        elevation: 100,
        inactiveColor: kGrey,
        activeColor: kBlue,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        height: 64,
        iconSize: 28,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
        },
        //other params
      ),
    );
  }
}
