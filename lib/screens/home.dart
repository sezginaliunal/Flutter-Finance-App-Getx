import 'package:finance_app/components/transaction_card.dart';
import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/constants/padding.dart';
import 'package:finance_app/constants/radius.dart';
import 'package:finance_app/constants/sizedBox.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/helpers/date_time.dart';
import 'package:finance_app/screens/fi_chart.dart';
import 'package:finance_app/widget/home_totalbalance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final TransactionController transactionController =
      Get.put(TransactionController());

  HomeScreen({super.key}) {
    // initState içinde tarihi başlangıçta şu anki zamana ayarladım
    transactionController.changeSelectedDate(DateTime.now());
    transactionController.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return _homeBody(context);
  }

  Widget _homeBody(BuildContext context) {
    return Obx(() {
      transactionController
          .filterTransactionsByMonth(transactionController.selectedDate.value);
      return Column(
        children: [
          Height.thirty,
          HomeTotalBalanceWidget(transactionController: transactionController),
          const FiChartPage(),
          Padding(
            padding: MyPaddings.paddingSmall,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: kShadowColor2,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: kDefaultIconDarkColor),
                    onPressed: () {
                      _changeMonth(-1);
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: kShadowColor2,
                        borderRadius: MyBorderRadius.circularEight),
                    child: Padding(
                      padding: MyPaddings.symmetricSix,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.date_range_outlined,
                            color: kDefaultIconDarkColor,
                          ),
                          Width.five,
                          Text(
                            customFormattedDate(
                                transactionController.selectedDate.value),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: kDefaultIconDarkColor,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: kShadowColor2,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: kTextColor),
                    onPressed: () {
                      _changeMonth(1);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: transactionController.filteredTransactions.isEmpty
                ? Center(
                    child: Text(
                      'Kayıtlı işlem geçmişi yoktur',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        transactionController.filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          transactionController.filteredTransactions[index];
                      return Padding(
                        padding: MyPaddings.symmetricSix,
                        child: TransactionCard(
                          dateTimeDay: formatDayName(transaction.time),
                          dateTimeNumber: formatOnlyDay(transaction.time),
                          dateTimeMonthYear: formatMonthYear(transaction.time),
                          icon: transaction.icon,
                          category: transaction.category,
                          pay:
                              '${transaction.isIncome ? '+' : '-'}${transaction.pay.toStringAsFixed(2)} ₺',
                          isIncome: transaction.isIncome,
                          description:
                              transaction.description ?? 'Açıklama yok',
                        ),
                      );
                    },
                  ),
          )
        ],
      );
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: transactionController.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      transactionController.changeSelectedDate(picked);
    }
  }

  void _changeMonth(int monthOffset) {
    final DateTime newDate = DateTime(
        transactionController.selectedDate.value.year,
        transactionController.selectedDate.value.month + monthOffset,
        1);
    transactionController.changeSelectedDate(newDate);
  }
}
