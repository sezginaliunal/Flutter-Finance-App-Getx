import 'package:finance_app/components/the_most_spending_card.dart';
import 'package:finance_app/constants/padding.dart';
import 'package:finance_app/constants/sizes.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';

class TheMostSpending extends StatelessWidget {
  TheMostSpending({
    super.key,
    required this.sortedCategoryExpenses,
  });

  final List<MapEntry<String, double>> sortedCategoryExpenses;
  final TransactionController controller = TransactionController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.onlyTop,
      child: Container(
          padding: MyPaddings.paddingMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MyPaddings.symmetricSix,
                child: Text(
                  'En Çok Harcama Yapılan Kategoriler',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Height.bes,
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: sortedCategoryExpenses.length,
                itemBuilder: (context, index) {
                  final entry = sortedCategoryExpenses[index];
                  final category = entry.key;
                  final amount = entry.value;
                  final icon = controller.transactionList
                      .firstWhere(
                          (transaction) => transaction.category == category)
                      .icon;

                  return TheMostSpendingCard(
                      icon: icon,
                      category: category,
                      pay: amount.toStringAsFixed(2));
                },
              ),
            ],
          )),
    );
  }
}
