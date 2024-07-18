import 'package:flutter/material.dart';

import '../../../model/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenseList, required this.onRemoveExpense});

  final List<Expense> expenseList;

  final Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseList[index].id),
        onDismissed: (_) {
          onRemoveExpense(expenseList[index]);
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        child: ExpenseItem(expense: expenseList[index]),
      ),
      itemCount: expenseList.length,
    );
  }
}
