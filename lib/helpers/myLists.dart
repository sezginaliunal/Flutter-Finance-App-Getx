import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/bill_screen.dart';
import 'package:finance_app/screens/chartScreen.dart';
import 'package:finance_app/screens/home.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  HomeScreen(),
  const ChartScreen(),
  const BillScreen(),
  const AddTransactionScreen(),
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
  'Çek/Senet',
  'İşlem ekle'
];
Map<String, double> categoryExpenses = {};
Map<String, double> categoryIncome = {};
Map<String, double> monthlyTotalBalances = {};
Map<String, bool> statusMap = {
  'Gelir': true,
  'Gider': false,
};
