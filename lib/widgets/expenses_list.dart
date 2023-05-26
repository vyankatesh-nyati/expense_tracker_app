import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenseList,
    required this.onRemoveExpense,
  });

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            onRemoveExpense(expenseList[index]);
          },
          key: ValueKey(expenseList[index]),
          child: ExpenseItem(expenseList[index])),
    );
  }
}
