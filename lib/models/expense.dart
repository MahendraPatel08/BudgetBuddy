import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, enjoyment, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.enjoyment: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.tital,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final double amount;
  final DateTime date;
  final String tital;
  final Category category;

  String get formmetedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.catagory, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.catagory)
      : expenses = allExpenses
            .where((expense) => expense.category == catagory)
            .toList();

  final Category catagory;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
