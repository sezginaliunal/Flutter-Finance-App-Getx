import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransactionController extends GetxController {
  final GetStorage storage = GetStorage();

  double calculateIncomeForSelectedMonth() {
    double income = 0;
    final selectedMonth = selectedDate.value.month;
    final selectedYear = selectedDate.value.year;

    for (var transaction in transactionList) {
      if (transaction.isIncome &&
          transaction.time.month == selectedMonth &&
          transaction.time.year == selectedYear) {
        income += transaction.pay;
      }
    }
    return income;
  }

  double calculateExpenseForSelectedMonth() {
    double expense = 0;
    final selectedMonth = selectedDate.value.month;
    final selectedYear = selectedDate.value.year;

    for (var transaction in transactionList) {
      if (!transaction.isIncome &&
          transaction.time.month == selectedMonth &&
          transaction.time.year == selectedYear) {
        expense += transaction.pay;
      }
    }
    return expense;
  }

  RxList<TransactionModel> transactionList = [
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Yemek',
        time: DateTime(
            DateTime.now().year, DateTime.now().month - 2, DateTime.now().day),
        pay: 100,
        isIncome: true),
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Alışveriş',
        time: DateTime(
            DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
        pay: 100,
        isIncome: false),
    TransactionModel(
        icon: Icons.mobile_friendly,
        category: 'Teknoloji',
        time: DateTime(
            DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
        pay: 1000,
        isIncome: false),
    TransactionModel(
        icon: Icons.mobile_friendly,
        category: 'MAAŞ',
        time: DateTime.now(),
        pay: 1500,
        isIncome: true),
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Transfer',
        time: DateTime.now(),
        pay: 100,
        isIncome: true),
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Tekstil',
        time: DateTime.now(),
        pay: 250,
        isIncome: false),
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Kahve',
        time: DateTime(
            DateTime.now().year, DateTime.now().month - 1, DateTime.now().day),
        pay: 200,
        isIncome: false),
    TransactionModel(
        icon: Icons.food_bank_outlined,
        category: 'Mobilya',
        time: DateTime.now(),
        pay: 400,
        isIncome: false),
  ].obs;

  // Yeni bir işlem eklemek için fonksiyon
  void addTransaction() {
    final addTransaction = TransactionModel(
      icon: Icons.food_bank_outlined,
      category: 'Mobilya',
      time: DateTime.now(),
      pay: 1250,
      isIncome: false,
    );

    transactionList.insert(0, addTransaction);
    Get.snackbar(
      'Mesaj',
      'İşlem eklendi',
      colorText: kBackgroundColor,
      backgroundColor: kPurpleColor,
    );
  }

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

  //Filtreleme
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxList filteredTransactions = [].obs;
  // void filterTransactionsByDate(DateTime selectedDate) {
  //   filteredTransactions.value = transactionList
  //       .where((transaction) => isSameDay(transaction.time, selectedDate))
  //       .toList();
  // }

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
