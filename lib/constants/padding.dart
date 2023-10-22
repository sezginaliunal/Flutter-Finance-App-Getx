import 'package:flutter/material.dart';

class MyPaddings {
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(30.0);
  static const EdgeInsets onlyRight = EdgeInsets.only(right: 10.0);
  static const EdgeInsets onlyLeft = EdgeInsets.only(left: 10.0);
  static const EdgeInsets onlyLeftTwenty = EdgeInsets.only(left: 20.0);
  static const EdgeInsets verticalHorizontalSpecial = EdgeInsets.symmetric(vertical: 10, horizontal: 15);
  static const EdgeInsets onlyTwelve = EdgeInsets.only(left: 12.0, right: 12);
  static const EdgeInsets specialThree = EdgeInsets.only(
    top: 20,
    left: 15,
    right: 15,
  );
  static const EdgeInsets symmetricSix =
      EdgeInsets.symmetric(vertical: 6, horizontal: 6);
  static const EdgeInsets specialTwo =
      EdgeInsets.symmetric(horizontal: 15, vertical: 30);
  static const EdgeInsets special =
      EdgeInsets.only(bottom: 34, left: 20, right: 20, top: 34);
  static const EdgeInsets symmetric =
      EdgeInsets.symmetric(horizontal: 18, vertical: 10);
  static const EdgeInsets onlyTop = EdgeInsets.only(
    top: 30,
  );
  static const EdgeInsets onlyTopEight = EdgeInsets.only(
    top: 8,
  );
  static const EdgeInsets verticalHorizontal =
      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0);
  static const EdgeInsets paddingConfirmButton =
      EdgeInsets.symmetric(horizontal: 28, vertical: 16);
}
