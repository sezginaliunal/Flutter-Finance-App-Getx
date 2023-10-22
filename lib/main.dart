import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/screens/bottom_navigation.dart';
import 'package:finance_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await GetStorage.init();
  await initializeDateFormatting('tr_TR', 'en_EN');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TransactionController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finans Uygulaması',
      theme: customTheme,
      home: const Scaffold(
        body: BottomNavigationScreen(),
      ),
    );
  }
}
