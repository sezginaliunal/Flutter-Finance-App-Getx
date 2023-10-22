import 'package:flutter/material.dart';

class TransactionModel {
  final IconData icon;
  final String category;
  final DateTime time;
  final double pay;
  final bool isIncome;
  final String? description;
  late double totalBalance;

  TransactionModel({
    required this.icon,
    required this.category,
    this.description,
    required this.time,
    required this.pay,
    required this.isIncome,
  }) {
    if (isIncome) {
      totalBalance = pay;
    } else {
      totalBalance = -pay;
    }
  }

  // TransactionModel'i JSON'a dönüştürme işlemi
  Map<String, dynamic> toJson() {
    return {
      'icon': icon
          .codePoint, // IconData'nın codePoint özelliğini kullanarak int olarak sakla
      'category': category,
      'description': description,
      'time': time.toIso8601String(),
      'pay': pay,
      'isIncome': isIncome,
      'totalBalance': totalBalance,
    };
  }

  // JSON'dan TransactionModel oluşturma işlemi
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      icon: IconData(json['icon'],
          fontFamily: 'MaterialIcons'), // IconData'ı geri yükle
      category: json['category'],
      description: json['description'],
      time: DateTime.parse(json['time']),
      pay: json['pay'],
      isIncome: json['isIncome'],
    );
  }
}
