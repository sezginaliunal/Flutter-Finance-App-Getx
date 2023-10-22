import 'dart:convert';

import 'package:finance_app/models/transaction_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }

  //Veriyi yükle
  Future<void> loadJsonData() async {
    final String jsonTransactions =
        await rootBundle.loadString('assets/transaction.json');
    final List<dynamic> decodedJson = jsonDecode(jsonTransactions);

    transactionList.value =
        decodedJson.map((data) => TransactionModel.fromJson(data)).toList().obs;

    // Verileri filteredTransactions listesine de ekleyin
    filteredTransactions.value =
        decodedJson.map((data) => TransactionModel.fromJson(data)).toList();
  }

  RxList transactionList = [].obs;
  //Filtreleme
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxList filteredTransactions = [].obs;

  // Gelirleri hesaplayan fonksiyon
  double calculateIncome() {
    double income = 0;
    for (var transaction in transactionList) {
      if (transaction.isIncome) {
        income += transaction.pay;
      }
    }
    return income;
  }

  // Giderleri hesaplayan fonksiyon
  double calculateExpense() {
    double expense = 0;
    for (var transaction in transactionList) {
      if (!transaction.isIncome) {
        expense += transaction.pay;
      }
    }
    return expense;
  }

  // Toplam bakiyeyi hesaplayan fonksiyon
  double calculateTotalBalance() {
    double totalIncome = calculateIncome();
    double totalExpense = calculateExpense();
    return totalIncome - totalExpense;
  }

  void changeSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    filterTransactionsByMonth(selectedDate.value);
  }

  void filterTransactionsByMonth(DateTime selectedDate) {
    final startOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final endOfMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0);

    filteredTransactions.value = transactionList
        .where((transaction) =>
            transaction.time.isAfter(startOfMonth) &&
            transaction.time.isBefore(endOfMonth))
        .toList();
  }
}
