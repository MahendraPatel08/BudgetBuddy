import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems(this.expenses, {super.key});

  final Expense expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expenses.tital),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '₹${expenses.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenses.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expenses.formmetedDate,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
