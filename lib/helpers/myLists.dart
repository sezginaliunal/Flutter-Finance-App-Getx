import 'package:finance_app/screens/chartScreen.dart';
import 'package:finance_app/screens/home.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  HomeScreen(),
  const ChartScreen(),
];
final List<IconData> iconList = [Icons.home, Icons.ac_unit_outlined];
final List<String> iconTitle = ['Anasayfa', 'Durumum'];
Map<String, double> categoryExpenses = {};
Map<String, double> categoryIncome = {};
Map<String, double> monthlyTotalBalances = {};
