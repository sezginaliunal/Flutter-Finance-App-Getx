import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/helpers/myLists.dart';
import 'package:finance_app/widget/bottom_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: pages[_currentIndex],
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }

  AnimatedBottomNavigationBar bottomNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 3,
      tabBuilder: (int index, bool isActive) {
        return BottomNavigatonBarItemsWidget(
          index: index,
          isActive: isActive,
        );
      },

      gapWidth: MediaQuery.of(context).size.width / 20,
      backgroundColor: kDefaultIconLightColor, // Tab bar arkaplan rengi
      activeIndex: _currentIndex, // Seçili sekme
      notchSmoothness:
          NotchSmoothness.defaultEdge, // Seçili tab'ın kenarlık yumuşaklığı
      // leftCornerRadius: 32,
      // rightCornerRadius: 32,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
