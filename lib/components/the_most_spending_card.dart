import 'package:finance_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TheMostSpendingCard extends StatelessWidget {
  const TheMostSpendingCard({
    super.key,
    required this.icon,
    required this.category,
    required this.pay,
  });
  final IconData icon;
  final String category;
  final String pay;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: kShadowColor2,
            radius: 25,
            child: Icon(
              icon,
              color: kPurpleColor,
            ),
          ),
          title: Text(category, style: Theme.of(context).textTheme.bodySmall),
          subtitle: Text(
            '$pay ₺',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    ));
  }
}
