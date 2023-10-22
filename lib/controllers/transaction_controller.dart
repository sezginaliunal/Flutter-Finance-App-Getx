import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TransactionController extends GetxController {
  final box = GetStorage();
  static const storageKey = 'transactions';

  // Veriyi cihaza kaydetme işlemi
  void saveDataToStorage() {
    final transactionListJson =
        transactionList.map((transaction) => transaction.toJson()).toList();
    box.write(storageKey, transactionListJson);
  }

  // Liste ve cihazdan veriyi kaldırmak için fonksiyon
  void removeTransaction(int index) {
    if (index >= 0 && index < transactionList.length) {
      // Veriyi cihazdan kaldır
      final removedTransaction = transactionList[index];
      final transactionListJson = transactionList
          .where((t) => t != removedTransaction)
          .map((transaction) => transaction.toJson())
          .toList();
      box.write(storageKey, transactionListJson);

      // Listeden kaldır
      transactionList.removeAt(index);

      // Filtrelenmiş listeyi güncelle
      filterTransactionsByMonth(selectedDate.value);
    }
  }

  // Cihazdan veriyi yükleme işlemi
  void loadDataFromStorage() {
    final storedData = box.read<List>('transactions');
    if (storedData != null) {
      transactionList.value = storedData
          .map((data) => TransactionModel.fromJson(data))
          .toList()
          .obs;
      filterTransactionsByMonth(selectedDate.value);
    }
  }

  RxList transactionList = [].obs;
  //Filtreleme
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxList filteredTransactions = [].obs;
  // Yeni bir işlem eklemek için fonksiyon
  // Ekleme işlemi (ekledikten sonra veriyi kaydet)
  void addTransaction(TransactionModel transactionModel) {
    final addTransaction = transactionModel;

    transactionList.insert(0, addTransaction);
    Get.snackbar(
      transactionModel.category,
      transactionModel.isIncome.toString(),
      colorText: kBackgroundColor,
      backgroundColor: kPurpleColor,
    );

    // Update filtered transactions
    update();

    // Veriyi cihaza kaydet
    saveDataToStorage();
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
