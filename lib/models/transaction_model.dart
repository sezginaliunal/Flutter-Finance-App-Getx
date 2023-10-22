import 'package:flutter/material.dart';

class TransactionModel {
  final IconData icon;
  final String category;
  final DateTime time;
  final double pay;
  final bool isIncome;
  late double totalBalance;

  TransactionModel(
      {required this.icon,
      required this.category,
      required this.time,
      required this.pay,
      required this.isIncome}) {
    if (isIncome) {
      totalBalance = pay;
    } else {
      totalBalance = -pay;
    }
  }
  Map<String, dynamic> toMap() {
    return {
      'icon': icon.codePoint,
      'category': category,
      'time': time.toIso8601String(),
      'pay': pay,
      'isIncome': isIncome,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      category: map['category'],
      time: DateTime.parse(map['time']),
      pay: map['pay'],
      isIncome: map['isIncome'],
    );
  }
}
