import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/helpers/myLists.dart';
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kGreenColor,
          onPressed: () => controller.addTransaction(),
          child: const Icon(Icons.add),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 2,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: isActive ? kGreenColor : kShadowColor1,
                ),
                Text(
                  iconTitle[index],
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: isActive ? kGreenColor : kTextColor,
                      ),
                )
              ],
            );
          },
          backgroundColor: kDefaultIconLightColor, // Tab bar arkaplan rengi
          activeIndex: _currentIndex, // Seçili sekme
          gapLocation: GapLocation.center,
          notchSmoothness:
              NotchSmoothness.defaultEdge, // Seçili tab'ın kenarlık yumuşaklığı
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
