import 'package:finance_app/constants/colors.dart';
import 'package:finance_app/constants/padding.dart';
import 'package:finance_app/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';

class HomeTotalBalanceWidget extends StatelessWidget {
  const HomeTotalBalanceWidget({
    super.key,
    required this.transactionController,
  });

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPaddings.symmetricSix,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _TextWidget(
                  text: 'Toplam Gelir',
                ),
                Text(
                  '${transactionController.calculateIncome()} ₺ ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kGreenColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _TextWidget(
                  text: 'Toplam Gider',
                ),
                Text(
                  '${transactionController.calculateExpense()} ₺ ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kRedColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _TextWidget(
                  text: 'Toplam Bakiye',
                ),
                Text(
                  '${transactionController.calculateTotalBalance()} ₺ ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: transactionController.calculateTotalBalance() > 0
                            ? kGreenColor
                            : kRedColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
