import 'package:flutter/cupertino.dart';

class MyBorderRadius {
  static BorderRadiusGeometry circularEight = BorderRadius.circular(8.0);
  static BorderRadiusGeometry circularTwenty = BorderRadius.circular(20);
  static BorderRadiusGeometry circularTen = BorderRadius.circular(10);
  static BorderRadiusGeometry circularNinety = BorderRadius.circular(90);
  static BorderRadiusGeometry onlyTwenty = BorderRadius.only(
    bottomRight: Radius.circular(
        20.0), // Sadece sağ alt köşeye yuvarlaklık değeri 20 olarak atanmıştır
  );
}
