import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:finance_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FiChartPage extends StatelessWidget {
  const FiChartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TransactionController transactionController =
        Get.find<TransactionController>();
    final RxList transactions = transactionController.transactionList;

    // Aylara göre toplam bakiyeyi hesapla
    Map<String, double> monthlyTotalBalances = {};

    for (TransactionModel transaction in transactions) {
      String monthYearKey =
          "${transaction.time.month}/${transaction.time.year}";

      monthlyTotalBalances[monthYearKey] =
          (monthlyTotalBalances[monthYearKey] ?? 0) + transaction.pay;
    }

    // Çizelgeyi oluştur
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: SfCartesianChart(
        title: ChartTitle(
            text: 'Gider Tablosu',
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith()),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          ColumnSeries<MapEntry<String, double>, String>(
            dataSource: monthlyTotalBalances.entries.toList(),
            xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
            yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
            width: 0.2,
          ),
        ],
      ),
    );
  }
}
