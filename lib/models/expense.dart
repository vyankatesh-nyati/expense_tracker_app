import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { leisure, work, food, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.categoryExpenseList,
    required this.category,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : categoryExpenseList = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> categoryExpenseList;

  double get totalExpenses {
    double sum = 0;

    for (Expense expense in categoryExpenseList) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
