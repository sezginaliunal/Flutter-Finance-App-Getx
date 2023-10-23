import 'package:finance_app/components/the_most_spending.dart';
import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/constants/padding.dart';
import 'package:finance_app/constants/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      builder: (transactionController) {
        if (transactionController.transactionList.isEmpty ||
            !transactionController.transactionList
                .any((transaction) => !transaction.isIncome)) {
          return Center(
            child: Text(
              'Kayıtlı Gider Verisi Yoktur.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        const Duration animationDuration = Duration(seconds: 3);

        // Kategorilere göre giderleri ve gelirleri hesapla
        Map<String, double> categoryExpenses = {};
        Map<String, double> categoryIncome = {};

        for (var transaction in transactionController.transactionList) {
          final category = transaction.category;
          final amount = transaction.pay;

          if (transaction.isIncome) {
            categoryIncome[category] = (categoryIncome[category] ?? 0) + amount;
          } else {
            categoryExpenses[category] =
                (categoryExpenses[category] ?? 0) + amount;
          }
        }

        // Kategorileri harcama miktarlarına göre büyükten küçüğe doğru sırala
        final sortedCategoryExpenses = categoryExpenses.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        return Padding(
          padding: MyPaddings.onlyTop,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Width.twenty,
                Text(
                  'Gider Grafiği',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                PieChart(
                  animationDuration: animationDuration,
                  dataMap: categoryExpenses,
                  chartRadius: MediaQuery.of(context).size.width / 1.7,
                  legendOptions: const LegendOptions(
                    legendShape: BoxShape.rectangle,
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    legendTextStyle: TextStyle(color: kTextColor),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    chartValueBackgroundColor: kPrimaryColor,
                    chartValueStyle: TextStyle(color: kBackgroundColor),
                    showChartValuesInPercentage: true,
                  ),
                ),
                SingleChildScrollView(
                  child: TheMostSpending(
                    sortedCategoryExpenses: sortedCategoryExpenses,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
