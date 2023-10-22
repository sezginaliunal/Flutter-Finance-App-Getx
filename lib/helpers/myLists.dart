import 'package:finance_app/screens/bill_screen.dart';
import 'package:finance_app/screens/chartScreen.dart';
import 'package:finance_app/screens/home.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  HomeScreen(),
  const ChartScreen(),
  const BillScreen(),
];
final List<IconData> iconList = [
  Icons.home,
  Icons.ac_unit_outlined,
  Icons.home,
  Icons.ac_unit_outlined,
];
final List<String> iconTitle = [
  'Anasayfa',
  'Durumum',
  'Takvimim',
];
Map<String, double> categoryExpenses = {};
Map<String, double> categoryIncome = {};
Map<String, double> monthlyTotalBalances = {};
Map<String, bool> statusMap = {
  'Gelir': true,
  'Gider': false,
};
