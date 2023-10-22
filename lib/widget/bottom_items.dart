import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/helpers/myLists.dart';
import 'package:flutter/material.dart';

class BottomNavigatonBarItemsWidget extends StatelessWidget {
  const BottomNavigatonBarItemsWidget({
    super.key,
    required this.index,
    required this.isActive,
  });
  final int index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );
  }
}
