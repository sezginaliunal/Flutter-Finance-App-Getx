import 'package:finance_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.dateTimeDay,
    required this.dateTimeNumber,
    required this.dateTimeMonthYear,
    required this.icon,
    required this.category,
    required this.pay,
    required this.isIncome,
    required this.description,
  });
  final String dateTimeDay;
  final String dateTimeNumber;
  final String dateTimeMonthYear;
  final IconData icon;
  final String description;
  final String category;
  final String pay;
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shadowColor: kShadowColor2,
        child: Column(
          children: [
            ListTile(
              trailing: isIncome
                  ? const Icon(
                      Icons.arrow_upward_outlined,
                      color: kGreenColor,
                    )
                  : const Icon(
                      Icons.arrow_downward_outlined,
                      color: kRedColor,
                    ),
              leading: CircleAvatar(
                backgroundColor: kBackgroundColor,
                radius: 25,
                child: Text(
                  dateTimeNumber,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              title: Text(
                dateTimeDay,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                dateTimeMonthYear,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: kShadowColor2,
                child: Icon(
                  icon,
                  color: kPurpleColor,
                ),
              ),
              title: Text(
                category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                pay,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: isIncome ? kGreenColor : kRedColor),
              ),
              subtitle: Text(
                description,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ));
  }
}
